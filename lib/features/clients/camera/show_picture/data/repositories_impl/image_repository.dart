import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/clients/camera/show_picture/data/external/image_api.dart';
import 'package:t_truck_app/features/clients/camera/show_picture/data/models/image_model.dart';
import 'package:t_truck_app/features/clients/camera/show_picture/domain/repositories/image_repository.dart';

class ImageRepository implements IImageRepository {
  IImageExternal iImageExternal;

  ImageRepository({
    required this.iImageExternal,
  });

  @override
  Future<Either<Failure, void>> save(ImageModel imageEntity) async {
    try {
      return Right(await iImageExternal.save(imageEntity));
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
