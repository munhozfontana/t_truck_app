import 'package:dartz/dartz.dart';

import '../../../core/error/api_exception.dart';
import '../../../core/error/failures.dart';
import '../../../core/messages/api_mensages.dart';
import '../../domain/entites/devolution_entity.dart';
import '../../domain/repositories/i_devolution_repository.dart';
import '../external/adapters/i_devolution_external.dart';

class DevolutionRepository implements IDevolutionRepository {
  IDevolutionExternal iDevolutionExternal;

  DevolutionRepository({
    required this.iDevolutionExternal,
  });

  @override
  Future<Either<Failure, List<DevolutionEntity>>> list() async {
    try {
      return Right(await iDevolutionExternal.list());
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
