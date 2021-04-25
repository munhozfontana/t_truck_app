import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/repositories/i_login_repository.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, void>> call(Params params);
}

class LoginUseCase implements UseCase<Type, Params> {
  ILoginRepository iLoginRepository;

  LoginUseCase({
    required this.iLoginRepository,
  });

  @override
  Future<Either<Failure, void>> call(Params params) {
    return iLoginRepository.login(params.credential!);
  }
}
