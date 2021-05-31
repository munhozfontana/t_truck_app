import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_order_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_receipt_external.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_driver.dart';
import 'package:t_truck_app/features/data/models/order_model.dart';
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
  ILoggedUser iLoggedUser;

  PaymentRepository({
    required this.cieloDriver,
    required this.iReceiptExternal,
    required this.iOrderExternal,
    required this.iLoggedUser,
  }) : super(
          iOrderExternal: iOrderExternal,
          iLoggedUser: iLoggedUser,
        );

  @override
  Future<Either<Failure, void>> pay(OrderEntity orderEntity) async {
    try {
      var orderToCielo = OrderModel.orderToCielo(orderEntity);

      var resFromCielo = await cieloDriver.payCielo(orderToCielo);

      return Left(AppFailure(
          detail:
              '${resFromCielo.paidAmount.toString()} - ${(resFromCielo.payments![0] as Map)['cieloCode']}'));
      // var listReceipt = ReceiptModel.cieloAndOrderToReceiptModel(
      //   resFromCielo,
      //   orderEntity,
      // );

      // if (!GetUtils.isNull(listReceipt)) {
      //   return Right(await iReceiptExternal.save(listReceipt!));
      // } else {
      //   return Left(AppFailure(detail: 'Erro ao recuperar dados da cielo'));
      // }
    } on ApiException catch (e) {
      return Left(AppFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
