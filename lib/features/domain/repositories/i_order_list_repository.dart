import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/domain/entites/orders.dart';

abstract class IOrderListRepository {
  Future<Either<Failure, List<Orders>>> orderlist();
}
