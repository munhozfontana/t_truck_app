import 'dart:convert';

import 'package:uuid/uuid.dart';

import '../../domain/entites/product_entity.dart';
import 'payment_type_gsa.dart';

class ProductModel extends ProductEntity {
  final int codProd;
  final int numTransVenda;

  ProductModel({
    required String id,
    required String name,
    required int maxQuantity,
    required int quantity,
    required bool show,
    this.codProd = 0,
    this.numTransVenda = 0,
  }) : super(
          id: id,
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
      id: Uuid().v4(),
      quantity: 0,
      show: false,
    );
  }

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  ProductModel copyWith({
    String? id,
    String? name,
    int? maxQuantity,
    int? quantity,
    bool? hidden,
    int? cODPROD,
    int? nUMTRANSVENDA,
    PaymentTypeGSA? paymentTypeGsa,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      maxQuantity: maxQuantity ?? this.maxQuantity,
      quantity: quantity ?? this.quantity,
      show: hidden ?? show,
      codProd: cODPROD ?? codProd,
      numTransVenda: nUMTRANSVENDA ?? numTransVenda,
    );
  }
}
