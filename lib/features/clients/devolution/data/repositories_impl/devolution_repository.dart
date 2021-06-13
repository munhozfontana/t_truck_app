import 'package:dartz/dartz.dart';
import 'package:t_truck_app/features/clients/devolution/data/models/devolution_model.dart';

import '../../../../../core/components/dropdown_default.dart';
import '../../../../../core/error/api_exception.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/messages/api_mensages.dart';
import '../../domain/repositories/i_devolution_repository.dart';
import '../external/devolution_api.dart';

class DevolutionRepository implements IDevolutionRepository {
  IDevolutionExternal iOccurrenceExternal;

  DevolutionRepository({
    required this.iOccurrenceExternal,
  });

  @override
  Future<Either<Failure, List<DropdownModel>>> list() async {
    try {
      return Right(await iOccurrenceExternal.list());
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }

  @override
  Future<Either<Failure, void>> save(
      List<DevolutionModel> listDevolution) async {
    try {
      return Right(await iOccurrenceExternal.save(listDevolution));
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
