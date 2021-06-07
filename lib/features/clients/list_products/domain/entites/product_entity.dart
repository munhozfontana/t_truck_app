class ProductEntity {
  final String? id;
  final String? name;
  final int? maxQuantity;
  final int? quantity;

  bool hidden = false;
  ProductEntity({
    this.id,
    this.name,
    this.maxQuantity,
    this.quantity,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductEntity &&
        other.id == id &&
        other.name == name &&
        other.maxQuantity == maxQuantity &&
        other.quantity == quantity &&
        other.hidden == hidden;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        maxQuantity.hashCode ^
        quantity.hashCode ^
        hidden.hashCode;
  }
}
