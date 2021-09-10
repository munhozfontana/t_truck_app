import 'dart:convert';

import '../../domain/entites/product_entity.dart';

class ProductModel extends ProductEntity {
  final int codProd;
  final int numTransVenda;
  final int codUsur;

  ProductModel(
      {required String name,
      required int maxQuantity,
      required int quantity,
      required bool show,
      this.codProd = 0,
      this.numTransVenda = 0,
      this.codUsur = 0})
      : super(
          name: name,
          maxQuantity: maxQuantity,
          quantity: quantity,
          show: show,
        );

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      codProd: map['CODPROD'],
      name: map['DESCRICAO'],
      maxQuantity: map['QT'],
      numTransVenda: map['NUMTRANSVENDA'],
      codUsur: map['CODUSUR'],
      quantity: 0,
      show: false,
    );
  }

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  ProductModel copyWith({
    int? codProd,
    int? numTransVenda,
    String? name,
    int? maxQuantity,
    int? quantity,
    bool? show,
    int? codUsur,
  }) {
    return ProductModel(
      codProd: codProd ?? this.codProd,
      numTransVenda: numTransVenda ?? this.numTransVenda,
      maxQuantity: maxQuantity ?? super.maxQuantity,
      name: name ?? super.name,
      quantity: quantity ?? super.quantity,
      show: show ?? super.show,
      codUsur: codUsur ?? this.codUsur,
    );
  }
}
