import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, void>> call(Params params);
}
