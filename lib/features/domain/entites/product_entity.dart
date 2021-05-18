class ProductEntity {
  final int codProd;
  final String descricao;
  bool? isCheck;
  final int qt;

  int qtToSend;

  ProductEntity({
    required this.codProd,
    required this.descricao,
    required this.isCheck,
    required this.qt,
    required this.qtToSend,
  });
}
