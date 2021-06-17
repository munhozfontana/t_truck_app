import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/clients/camera/show_picture/domain/entites/image_entity.dart';

mixin IImageRepository {
  Future<Either<Failure, void>> save(ImageEntity imageEntity);
}
