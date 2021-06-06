import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/clients/list_clients/data/models/clients_model.dart';

abstract class IClientsRepository {
  Future<Either<Failure, List<ClientModel>>> getAll();
}
