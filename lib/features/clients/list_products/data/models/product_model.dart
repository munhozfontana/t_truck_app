import 'dart:convert';

import 'package:uuid/uuid.dart';

import '../../domain/entites/product_entity.dart';
import 'payment_type_gsa.dart';

class ProductModel extends ProductEntity {
  PaymentTypeGSA? paymentTypeGsa;

  int cODPROD;
  String dESCRICAO;
  int qT;
  int nUMTRANSVENDA;

  ProductModel({
    this.paymentTypeGsa,
    required this.cODPROD,
    required this.dESCRICAO,
    required this.qT,
    required this.nUMTRANSVENDA,
  }) : super(
          id: Uuid().v4(),
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
}
