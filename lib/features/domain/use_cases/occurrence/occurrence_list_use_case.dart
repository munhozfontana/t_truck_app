import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/params/params.dart';
import '../../../../core/use_case.dart';
import '../../entites/occurrence_entity.dart';
import '../../repositories/i_occurrence_repository.dart';

class OccurrenceListUseCase implements UseCaseAsync<Type, Params> {
  IOccurrenceRepository iOccurrenceListRepository;

  OccurrenceListUseCase({
    required this.iOccurrenceListRepository,
  });

  @override
  Future<Either<Failure, List<OccurrenceEntity>>> call(Params params) async {
    return iOccurrenceListRepository.list();
  }
}
