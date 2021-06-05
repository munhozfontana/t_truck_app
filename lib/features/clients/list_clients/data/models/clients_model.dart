import 'dart:convert';

import 'package:t_truck_app/features/clients/client_detail/domain/entites/invoice_entity.dart';
import 'package:t_truck_app/features/clients/list_clients/domain/entites/client_entity.dart';
import 'package:uuid/uuid.dart';

class ClientModel extends ClientEntity {
  final int? codCli;
  final String? cliente;
  final int? qtde;

  ClientModel({
    this.codCli,
    this.cliente,
    this.qtde,
  }) : super(
            id: Uuid().v4(),
            name: cliente,
            invoices: List.generate(qtde!, (index) => InvoiceEntity()));

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
