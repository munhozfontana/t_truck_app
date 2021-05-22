class OccurrenceEntity {
  final int codProduto;
  final String descricao;

  OccurrenceEntity({
    required this.codProduto,
    required this.descricao,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OccurrenceEntity &&
        other.codProduto == codProduto &&
        other.descricao == descricao;
  }

  @override
  int get hashCode => codProduto.hashCode ^ descricao.hashCode;
}
