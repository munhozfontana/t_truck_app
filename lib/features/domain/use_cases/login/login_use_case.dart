import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/core/use_case.dart';
import 'package:t_truck_app/features/domain/repositories/i_login_repository.dart';

class LoginUseCase implements UseCase<Type, Params> {
  ILoginRepository iLoginRepository;

  LoginUseCase({
    required this.iLoginRepository,
  });

  @override
  Future<Either<Failure, void>> call(Params params) async {
    if (params.credential == null) {
      return Left(ValidationFailure(detail: 'Credencias são abrigatórias'));
    }

    if (params.credential!.login.isEmpty) {
      return Left(ValidationFailure(detail: 'Login não pode ser vazio'));
    }

    if (params.credential!.password.isEmpty) {
      return Left(ValidationFailure(detail: 'Senha não pode ser vazio'));
    }

    return iLoginRepository.login(params.credential!);
  }
}
