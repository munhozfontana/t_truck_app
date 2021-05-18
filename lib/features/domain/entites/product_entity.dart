class ProductEntity {
  final int codProd;
  final String descricao;
  final int qt;

  int qtToSend;

  ProductEntity({
    required this.codProd,
    required this.descricao,
    required this.qt,
    required this.qtToSend,
  });
}
