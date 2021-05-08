import 'dart:convert';

import 'package:t_truck_app/features/domain/entites/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required String numTransVenda,
    required String dtCanhato,
    required int numNota,
    required String codCliCliente,
    required int codCli,
  }) : super(
          numTransVenda: numTransVenda,
          dtCanhato: dtCanhato,
          numNota: numNota,
          codCliCliente: codCliCliente,
          codCli: codCli,
        );

  Map<String, dynamic> toMap() {
    return {
      'numTransVenda': numTransVenda,
      'dtCanhato': dtCanhato,
      'numNota': numNota,
      'codCliCliente': codCliCliente,
      'codCli': codCli,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      numTransVenda: map['numTransVenda'],
      dtCanhato: map['dtCanhato'],
      numNota: map['numNota'],
      codCliCliente: map['codCliCliente'],
      codCli: map['codCli'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));
}
