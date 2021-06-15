import 'dart:convert';

import 'package:uuid/uuid.dart';

import '../../domain/entites/product_entity.dart';
import 'payment_type_gsa.dart';

class ProductModel extends ProductEntity {
  @override
  final String id;
  @override
  final String name;
  @override
  final int maxQuantity;
  @override
  final int quantity;
  @override
  bool show;
  final int codProd;
  final int numTransVenda;

  ProductModel({
    required this.id,
    this.name = 'Não encontrado',
    this.maxQuantity = 0,
    this.quantity = 0,
    this.show = true,
    this.codProd = 0,
    this.numTransVenda = 0,
  }) : super(
          name: name,
          maxQuantity: maxQuantity,
          quantity: quantity,
        );

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      codProd: map['CODPROD'],
      name: map['DESCRICAO'],
      maxQuantity: map['QT'],
      numTransVenda: map['NUMTRANSVENDA'],
      id: Uuid().v4(),
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
      codProd: cODPROD ?? this.codProd,
      numTransVenda: nUMTRANSVENDA ?? this.numTransVenda,
    );
  }
}
