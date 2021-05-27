import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_devolution_external.dart';
import 'package:t_truck_app/features/domain/entites/devolution_entity.dart';
import 'package:t_truck_app/features/domain/repositories/devolution_repository.dart';

class DevolutionRepository implements IDevolutionRepository {
  final IDevolutionExternal devolutionExternal;

  DevolutionRepository({required this.devolutionExternal});

  @override
  Future<Either<Failure, void>> save(List<DevolutionEntity> imageEntity) async {
    try {
      return Right(await devolutionExternal.save(imageEntity));
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
