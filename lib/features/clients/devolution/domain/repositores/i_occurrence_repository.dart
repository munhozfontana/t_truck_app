import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/domain/entites/occurrence_entity.dart';

mixin IOccurrenceRepository {
  Future<Either<Failure, List<OccurrenceEntity>>> list();
}
