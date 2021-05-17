import 'dart:convert';

import 'package:t_truck_app/features/domain/entites/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required int codProd,
    required String descricao,
    required bool isCheck,
    required int qt,
  }) : super(
          codProd: codProd,
          descricao: descricao,
          isCheck: isCheck,
          qt: qt,
        );

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      codProd: map['CODPROD'],
      descricao: map['DESCRICAO'],
      isCheck: false,
      qt: (map['QT'] as num).toInt(),
    );
  }

  static List<ProductModel> listFromJson(String? body) {
    List list = jsonDecode(body!);
    return list.map((order) {
      return ProductModel.fromMap(order);
    }).toList();
  }
}
