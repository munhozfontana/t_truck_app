import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../data/models/client_model.dart';

abstract class IClientsRepository {
  Future<Either<Failure, List<ClientModel>>> getAll();
}
