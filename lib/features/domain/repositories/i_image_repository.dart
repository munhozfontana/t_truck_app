import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/domain/entites/image_entity.dart';

abstract class IImageRepository {
  Future<Either<Failure, void>> save(ImageEntity imageEntity);
}
