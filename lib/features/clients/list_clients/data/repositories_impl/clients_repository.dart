import 'package:dartz/dartz.dart';

import '../../../../../core/error/api_exception.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/messages/api_mensages.dart';
import '../../domain/repositores/i_clients_repository.dart';
import '../external/clients_api.dart';
import '../models/client_model.dart';

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
