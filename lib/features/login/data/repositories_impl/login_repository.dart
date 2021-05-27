import 'package:dartz/dartz.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/messages/api_mensages.dart';
import '../../domain/entites/credential_entity.dart';
import '../../domain/repositores/i_login_repository.dart';
import '../external/login_api.dart';

class LoginRepository implements ILoginRepository {
  ILogin iLoginApi;

  LoginRepository({
    required this.iLoginApi,
  });

  @override
  Future<Either<Failure, String>> login(CredentialEntity credentials) async {
    try {
      return Right(await iLoginApi.login(credentials));
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
