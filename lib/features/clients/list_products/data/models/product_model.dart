import 'dart:convert';

import '../../domain/entites/product_entity.dart';
import 'payment_type_gsa.dart';

class ProductModel extends ProductEntity {
  final PaymentTypeGSA? paymentType;

  ProductModel({
    String? id,
    String? name,
    int? maxQuantity,
    int? quantity,
    this.paymentType,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'maxQuantity': maxQuantity,
      'quantity': quantity,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'],
      maxQuantity: map['maxQuantity'],
      quantity: map['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
