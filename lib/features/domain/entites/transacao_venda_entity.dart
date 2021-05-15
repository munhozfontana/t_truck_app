class TransacaoVendaEntity {
  final int numTransVenda;
  final int numNota;
  final num? valor;

  TransacaoVendaEntity({
    required this.numTransVenda,
    required this.numNota,
    this.valor,
  });
}
