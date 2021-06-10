import 'dart:convert';

import '../../domain/entites/product_entity.dart';
import 'payment_type_gsa.dart';

class ProductModel extends ProductEntity {
  final PaymentTypeGSA? paymentTypeGsa;
  final int cODPROD;
  final String dESCRICAO;
  final int qT;
  final int nUMTRANSVENDA;

  @override
  final int quantity;

  ProductModel({
    this.paymentTypeGsa,
    this.cODPROD = 0,
    this.dESCRICAO = 'Não encontrado',
    this.qT = 0,
    this.nUMTRANSVENDA = 0,
    this.quantity = 0,
  }) : super(
          name: dESCRICAO,
          maxQuantity: qT,
          quantity: 0,
        );

  Map<String, dynamic> toMap() {
    return {
      'CODPROD': cODPROD,
      'DESCRICAO': dESCRICAO,
      'QT': qT,
      'NUMTRANSVENDA': nUMTRANSVENDA,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      cODPROD: map['CODPROD'],
      dESCRICAO: map['DESCRICAO'],
      qT: map['QT'],
      nUMTRANSVENDA: map['NUMTRANSVENDA'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  ProductModel copyWith({
    PaymentTypeGSA? paymentTypeGsa,
    int? cODPROD,
    String? dESCRICAO,
    int? qT,
    int? nUMTRANSVENDA,
    int? quantity,
  }) {
    return ProductModel(
      paymentTypeGsa: paymentTypeGsa ?? this.paymentTypeGsa,
      cODPROD: cODPROD ?? this.cODPROD,
      dESCRICAO: dESCRICAO ?? this.dESCRICAO,
      qT: qT ?? this.qT,
      nUMTRANSVENDA: nUMTRANSVENDA ?? this.nUMTRANSVENDA,
      quantity: quantity ?? this.quantity,
    );
  }
}
