class ProductEntity {
  String? id;
  String? name;
  int? maxQuantity;
  int? quantity;
  bool hidden = false;

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
