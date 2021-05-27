import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/params/params.dart';
import '../../../../../core/use_case.dart';

class DevolutionSaveUseCase implements UseCaseAsync<Type, Params> {
  @override
  Future<Either<Failure, void>> call(Params params) async {
    return Future.value();
  }
}
