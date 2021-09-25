import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../../core/adapters/protocols/i_http_external.dart';
import '../../../../../core/error/api_exception.dart';
import '../models/client_model.dart';

mixin IClientAdapter {
  Future<List<ClientModel>> getAll();
}

class ClientsApi implements IClientAdapter {
  IHttp iHttp;

  ClientsApi({
    required this.iHttp,
  });

  @override
  Future<List<ClientModel>> getAll() async {
    try {
      var res = await iHttp.getHttp(
        '${env['URL_BASE']}/order',
      );
      List list = json.decode(res.body!);
      return list
          .map(
            (e) => ClientModel.fromMap(e),
          )
          .toList();
    } on ApiException catch (e) {
      throw ApiException(error: e.toString());
    } catch (e) {
      throw ApiException(error: 'Erro ao obter lista de clientes');
    }
  }
}
