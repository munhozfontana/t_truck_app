class TransacaoVendaEntity {
  final int numTransVenda;
  final int numNota;
  final num? valor;
  final String prest;

  TransacaoVendaEntity({
    required this.numTransVenda,
    required this.numNota,
    this.valor,
    required this.prest,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransacaoVendaEntity &&
        other.numTransVenda == numTransVenda &&
        other.numNota == numNota &&
        other.valor == valor &&
        other.prest == prest;
  }

  @override
  int get hashCode {
    return numTransVenda.hashCode ^
        numNota.hashCode ^
        valor.hashCode ^
        prest.hashCode;
  }
}
