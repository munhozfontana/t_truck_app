import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../../core/components/dropdown_default.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/params/params.dart';
import '../../../../../core/use_case.dart';
import '../repositories/i_devolution_repository.dart';

class DevolutionListUseCase implements UseCaseAsync<Type, Params> {
  IDevolutionRepository iDevolutionRepository;

  DevolutionListUseCase({
    required this.iDevolutionRepository,
  });

  @override
  Future<Either<Failure, List<DropdownModel>>> call(Params params) async {
    return await iDevolutionRepository.list();
  }
}
