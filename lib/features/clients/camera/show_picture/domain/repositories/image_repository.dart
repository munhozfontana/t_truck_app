import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/clients/camera/show_picture/data/models/image_model.dart';

mixin IImageRepository {
  Future<Either<Failure, void>> save(ImageModel imageModel);
}
