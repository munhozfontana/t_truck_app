import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/domain/entites/credential.dart';

abstract class ILoginRepository {
  Future<Either<Failure, void>> login(Credential credentials);
}
