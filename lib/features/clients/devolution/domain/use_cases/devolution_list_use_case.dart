import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/params/params.dart';
import '../../../../../core/use_case.dart';

class OccurrenceListUseCase implements UseCaseAsync<Type, Params> {
  @override
  Future<Either<Failure, List<dynamic>>> call(Params params) async {
    return Right([]);
  }
}
