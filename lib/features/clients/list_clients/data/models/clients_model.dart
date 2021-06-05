import 'dart:convert';

import 'package:t_truck_app/features/clients/list_clients/domain/entites/client_entity.dart';

class ClientModel extends ClientEntity {
  int? codCli;
  String? cliente;
  int? qtde;

  ClientModel({
    this.codCli,
    this.cliente,
    this.qtde,
  }) : super(
          name: cliente,
        );

  Map<String, dynamic> toMap() {
    return {
      'codCli': codCli,
      'cliente': cliente,
      'qtde': qtde,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      codCli: map['CODCLI'],
      cliente: map['CLIENTE'],
      qtde: map['QTDE'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) =>
      ClientModel.fromMap(json.decode(source));
}
