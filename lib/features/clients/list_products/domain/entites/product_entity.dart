import 'package:t_truck_app/core/utils/base_entity.dart';

class ProductEntity extends BaseEntity {
  final String name;
  final int maxQuantity;
  final int quantity;
  bool show;

  ProductEntity({
    this.name = '',
    this.maxQuantity = 0,
    this.quantity = 0,
    this.show = false,
  });

  ProductEntity copyWith({
    String? name,
    int? maxQuantity,
    int? quantity,
    bool? show,
  }) {
    return ProductEntity(
      name: name ?? this.name,
      maxQuantity: maxQuantity ?? this.maxQuantity,
      quantity: quantity ?? this.quantity,
      show: show ?? this.show,
    );
  }
}
