import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';

abstract class ITokenRepository {
  Either<Failure, Map> jwtDecode(String token);
  Either<Failure, bool> expired(String token);
}
