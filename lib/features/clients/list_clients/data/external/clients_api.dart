import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_truck_app/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_app/core/adapters/protocols/i_logged_user.dart';
import 'package:t_truck_app/features/clients/list_clients/data/models/clients_model.dart';

mixin IClientAdapter {
  Future<List<ClientModel>> getAll();
}

class ClientsApi implements IClientAdapter {
  IHttp iHttp;
  ILoggedUser iLoggedUser;

  ClientsApi({
    required this.iHttp,
    required this.iLoggedUser,
  });

  @override
  Future<List<ClientModel>> getAll() async {
    try {
      var res =
          await iHttp.getHttp('${env['URL_BASE']}/order/${iLoggedUser.login}');
      var clientModel = ClientModel.fromJson(res.body!);
      return orderByIdentificacao;
    } catch (e) {
      throw ApiException(error: ApiMensages.Order_LIST_ERROR);
    }
  }
}
