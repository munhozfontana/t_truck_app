import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';

abstract class IOrderListRepository {
  Future<Either<Failure, List<Order>>> orderlist();
}
