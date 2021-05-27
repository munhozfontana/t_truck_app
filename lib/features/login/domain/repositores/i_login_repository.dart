import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/credential_entity.dart';

abstract class ILoginRepository {
  Future<Either<Failure, String>> login(CredentialEntity credentials);
}
