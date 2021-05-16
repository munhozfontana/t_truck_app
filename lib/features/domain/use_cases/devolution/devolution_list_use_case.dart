import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/params/params.dart';
import '../../../../core/use_case.dart';
import '../../entites/devolution_entity.dart';
import '../../repositories/i_devolution_repository.dart';

class DevolutionListUseCase implements UseCaseAsync<Type, Params> {
  IDevolutionRepository iDevolutionListRepository;

  DevolutionListUseCase({
    required this.iDevolutionListRepository,
  });

  @override
  Future<Either<Failure, List<DevolutionEntity>>> call(Params params) async {
    return iDevolutionListRepository.list();
  }
}
