import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
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

  PaymentRepository({
    required this.cieloDriver,
    required this.iReceiptExternal,
    required this.iOrderExternal,
  }) : super(
          iOrderExternal: iOrderExternal,
        );

  @override
  Future<Either<Failure, void>> pay(OrderEntity orderEntity) async {
    var resFromCielo = await cieloDriver.payCielo(
      OrderModel.orderToCielo(orderEntity),
    );

    var listReceiptModel = ReceiptModel.cieloAndOrderToReceiptModel(
      resFromCielo,
      orderEntity,
    );

    await iReceiptExternal.save(listReceiptModel);
    return Right(null);
  }
}
