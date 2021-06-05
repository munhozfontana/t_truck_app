import 'package:t_truck_app/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_app/features/clients/list_clients/data/models/clients_model.dart';

mixin IClientAdapter {
  Future<List<ClientModel>> getAll();
}

class ClientsApi implements IClientAdapter {
  IHttp iHttp;

  ClientsApi({
    required this.iHttp,
  });

  @override
  Future<List<ClientModel>> getAll() {
    return Future.value([]);
  }
}
