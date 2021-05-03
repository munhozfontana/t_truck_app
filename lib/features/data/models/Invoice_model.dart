import 'dart:convert';

import 'package:t_truck_app/features/domain/entites/invoice.dart';

class InvoiceModel extends Invoice {
  InvoiceModel({
    required String nomeMercado,
    required int quantidade,
  }) : super(
          nomeMercado: nomeMercado,
          quantidade: quantidade,
        );

  Map<String, dynamic> toMap() {
    return {
      'nomeMercado': nomeMercado,
      'quantidade': quantidade,
    };
  }

  factory InvoiceModel.fromMap(Map<String, dynamic> map) {
    return InvoiceModel(
      nomeMercado: map['nomeMercado'],
      quantidade: map['quantidade'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InvoiceModel.fromJson(String source) => InvoiceModel.fromMap(
        json.decode(source),
      );
}
