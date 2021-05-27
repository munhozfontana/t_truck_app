import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/login/domain/entites/credential_entity.dart';

abstract class ILoginRepository {
  Future<Either<Failure, String>> login(CredentialEntity credentials);
}
