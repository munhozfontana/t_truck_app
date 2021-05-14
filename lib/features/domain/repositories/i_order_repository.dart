import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';

abstract class IOrderRepository {
  Future<Either<Failure, List<OrderEntity>>> list();
}

abstract class IOrderPaymentRepository extends IOrderRepository {
  Future<Either<Failure, void>> pay(OrderEntity listOrderEntity);
}
