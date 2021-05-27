import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_image_external.dart';
import 'package:t_truck_app/features/domain/entites/image_entity.dart';
import 'package:t_truck_app/features/domain/repositories/i_image_repository.dart';

class ImageRepository implements IImageRepository {
  IImageExternal iImageExternal;

  ImageRepository({
    required this.iImageExternal,
  });

  @override
  Future<Either<Failure, void>> save(ImageEntity imageEntity) async {
    try {
      return Right(await iImageExternal.save(imageEntity));
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
