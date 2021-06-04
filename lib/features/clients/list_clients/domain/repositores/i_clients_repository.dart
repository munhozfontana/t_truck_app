import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/clients/list_clients/domain/entites/client_entity.dart';

abstract class IClientsRepository {
  Future<Either<Failure, List<ClientEntity>>> getAll();
}
