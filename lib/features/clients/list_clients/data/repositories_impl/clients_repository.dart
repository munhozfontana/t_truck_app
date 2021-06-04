import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/clients/list_clients/domain/entites/client_entity.dart';
import 'package:t_truck_app/features/clients/list_clients/domain/repositores/i_clients_repository.dart';

class ClientsRepository implements IClientsRepository {
  @override
  Future<Either<Failure, List<ClientEntity>>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
}
