import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/driver_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_jwt_external.dart';
import 'package:t_truck_app/features/domain/repositories/i_token_repository.dart';

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
