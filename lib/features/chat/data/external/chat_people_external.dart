import 'dart:convert';

import 'package:t_truck_app/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/features/chat/domain/entities/chat_person_entity.dart';

import 'protocols/i_chat_people_external.dart';

class ChatPeopleExternal implements IChatPeopleExternal {
  IHttp iHttp;

  ChatPeopleExternal({
    required this.iHttp,
  });

  @override
  Future<List<ChatPerson>> listByToken(int perfil) async {
    try {
      final res = await iHttp.postHttp(
        'http://truck.stoatacadista.com.br:2302/api/listaAdmin',
      );

      List list = json.decode(res.body!) as List;
      var listProductsModel = list.map(
        (e) {
          return ChatPerson.fromMap(e as Map<String, dynamic>);
        },
      ).toList();
      return listProductsModel;
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
