import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';

abstract class IPaymentRepository {
  Future<Either<Failure, void>> pay(List<OrderEntity> listOrderEntity);
}
