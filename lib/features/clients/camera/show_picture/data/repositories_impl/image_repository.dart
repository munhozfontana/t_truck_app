import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/clients/camera/show_picture/data/external/image_api.dart';
import 'package:t_truck_app/features/clients/camera/show_picture/domain/entites/image_entity.dart';
import 'package:t_truck_app/features/clients/camera/show_picture/domain/repositories/image_repository.dart';

class ImageRepository implements IImageRepository {
  IImageExternal iImageExternal;

  ImageRepository({
    required this.iImageExternal,
  });

  @override
  Future<Either<Failure, void>> save(ImageEntity imageEntity) async {
    try {
      return Right(await iImageExternal.save(imageEntity));
      // ImageModel.toJson(imageEntity);
      // return Right(true);
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
