import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/adapters/protocols/i_local_store_external.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/params/params.dart';
import '../../../../core/use_case.dart';
import '../repositores/i_login_repository.dart';

class LoginUseCase implements UseCaseAsync<Type, Params> {
  final ILoginRepository iLoginRepository;
  final ILocalStoreExternal iLocalStoreExternal;

  LoginUseCase({
    required this.iLoginRepository,
    required this.iLocalStoreExternal,
  });

  @override
  Future<Either<Failure, String>> call(Params params) async {
    if (params.credential == null) {
      return Left(ValidationFailure(detail: 'Credencias são abrigatórias'));
    }

    if (params.credential!.login.isEmpty) {
      return Left(ValidationFailure(detail: 'Login não pode ser vazio'));
    }

    if (params.credential!.password.isEmpty) {
      return Left(ValidationFailure(detail: 'Senha não pode ser vazio'));
    }

    var res = iLoginRepository.login(params.credential!);

    await (await res).fold(
      (l) => null,
      (r) async {
        await iLocalStoreExternal.save('token', r);
      },
    );
    return res;
  }
}
