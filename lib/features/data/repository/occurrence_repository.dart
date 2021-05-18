import 'package:dartz/dartz.dart';

import '../../../core/error/api_exception.dart';
import '../../../core/error/failures.dart';
import '../../../core/messages/api_mensages.dart';
import '../../domain/entites/occurrence_entity.dart';
import '../../domain/repositories/i_occurrence_repository.dart';
import '../external/adapters/i_occurrence_external.dart';

class OccurrenceRepository implements IOccurrenceRepository {
  IOccurrenceExternal iOccurrenceExternal;

  OccurrenceRepository({
    required this.iOccurrenceExternal,
  });

  @override
  Future<Either<Failure, List<OccurrenceEntity>>> list() async {
    try {
      return Right(await iOccurrenceExternal.list());
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
