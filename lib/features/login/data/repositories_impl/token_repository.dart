import 'package:dartz/dartz.dart';

import '../../../../core/adapters/protocols/i_jwt_external.dart';
import '../../../../core/error/driver_exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/messages/api_mensages.dart';
import '../../domain/repositores/i_token_repository.dart';

class TokenRepository implements ITokenRepository {
  final IJwt jwtDriver;

  TokenRepository({required this.jwtDriver});

  @override
  Either<Failure, bool> expired(token) {
    try {
      return Right(jwtDriver.isExpired(token));
    } on DriverException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }

  @override
  Either<Failure, Map> jwtDecode(token) {
    try {
      return Right(jwtDriver.jwtDecode(token));
    } on DriverException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
