import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/domain/entites/devolution_entity.dart';

mixin IDevolutionRepository {
  Future<Either<Failure, List<DevolutionEntity>>> list();
}
