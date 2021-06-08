import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../../core/adapters/protocols/i_http_external.dart';
import '../../../../../core/adapters/protocols/i_logged_user.dart';
import '../../../../../core/error/api_exception.dart';
import '../models/client_model.dart';

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
    var usuarioLogado = await iLoggedUser.login;

    try {
      var resOrder = await iHttp.getHttp(
        '${env['URL_BASE']}/order/$usuarioLogado',
      );

      List listOrders = json.decode(resOrder.body!);

      var resProduct = await iHttp.postHttp(
        '${env['URL_BASE']}/product',
        body: {'NUMTRANSVENDA': listOrders},
      );

      List listProducts = json.decode(resProduct.body!);

      listOrders
          .map(
            (e) => ClientModel.fromMap(e)..produtos,
          )
          .toList();
      return [];
    } catch (e) {
      throw ApiException(error: 'Erro ao obter lista de clientes');
    }
  }
}
