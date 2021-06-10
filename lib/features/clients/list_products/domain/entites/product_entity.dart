class ProductEntity {
  final String id;
  final String name;
  final int maxQuantity;
  final int quantity;
  bool hidden;

  ProductEntity({
    this.id = '',
    this.name = '',
    this.maxQuantity = 0,
    this.quantity = 0,
    this.hidden = false,
  });
}
