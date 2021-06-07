import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/clients/list_clients/data/external/clients_api.dart';
import 'package:t_truck_app/features/clients/list_clients/data/models/client_model.dart';
import 'package:t_truck_app/features/clients/list_clients/domain/repositores/i_clients_repository.dart';

class ClientsRepository implements IClientsRepository {
  IClientAdapter iClientAdapter;

  ClientsRepository({
    required this.iClientAdapter,
  });

  @override
  Future<Either<Failure, List<ClientModel>>> getAll() async {
    try {
      return Right(await iClientAdapter.getAll());
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
