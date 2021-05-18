import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_jwt_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_local_store_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_order_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_receipt_external.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_driver.dart';
import 'package:t_truck_app/features/data/models/order_model.dart';
import 'package:t_truck_app/features/data/models/receipt_model.dart';
import 'package:t_truck_app/features/data/repository/order_repository.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/repositories/i_order_repository.dart';

class PaymentRepository extends OrderRepository
    implements IOrderPaymentRepository {
  @override
  final IOrderExternal iOrderExternal;
  final CieloDriver cieloDriver;
  final IReceiptExternal iReceiptExternal;

  @override
  final ILocalStoreExternal iLocalStoreExternal;

  @override
  final IJwt iJwt;

  PaymentRepository({
    required this.cieloDriver,
    required this.iReceiptExternal,
    required this.iOrderExternal,
    required this.iLocalStoreExternal,
    required this.iJwt,
  }) : super(
          iOrderExternal: iOrderExternal,
          iLocalStoreExternal: iLocalStoreExternal,
          iJwt: iJwt,
        );

  @override
  Future<Either<Failure, void>> pay(OrderEntity orderEntity) async {
    try {
      var orderToCielo = OrderModel.orderToCielo(orderEntity);

      var resFromCielo = await cieloDriver.payCielo(orderToCielo);

      var listReceipt = ReceiptModel.cieloAndOrderToReceiptModel(
        resFromCielo,
        orderEntity,
      );

      return Right(await iReceiptExternal.save(listReceipt));
    } on ApiException catch (e) {
      return Left(AppFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
