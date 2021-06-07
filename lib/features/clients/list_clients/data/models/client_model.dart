import 'dart:convert';

import 'package:uuid/uuid.dart';

import '../../domain/entites/client_entity.dart';

class ClientModel extends ClientEntity {
  final int? codCli;
  final String cliente;

  ClientModel({
    required int this.codCli,
    required this.cliente,
    required int qtde,
  }) : super(
            id: Uuid().v4(),
            name: cliente,
            produtos: [],
            qtde: qtde,
            clientId: codCli);

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
