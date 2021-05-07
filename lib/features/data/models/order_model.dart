import 'dart:convert';

import 'package:t_truck_app/features/domain/entites/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
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

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      nomeMercado: map['nomeMercado'],
      quantidade: map['quantidade'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(
        json.decode(source),
      );
}
