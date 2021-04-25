import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_login.dart';
import 'package:t_truck_app/features/domain/entites/credential.dart';
import 'package:t_truck_app/features/domain/repositories/i_login_repository.dart';

class LoginRepository implements ILoginRepository {
  ILogin iLoginApi;

  LoginRepository({
    required this.iLoginApi,
  });

  @override
  Future<Either<Failure, bool>> login(Credential credentials) async {
    try {
      return Right(await iLoginApi.login(credentials));
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.EXTERNAL_ERROR));
    }
  }
}
