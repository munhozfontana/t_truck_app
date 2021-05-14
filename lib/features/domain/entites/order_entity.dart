class OrderEntity {
  final String? dtCanhato;
  final String cliente;
  final int codCli;
  final List<TransacaoVenda> identificacoes;

  OrderEntity({
    this.dtCanhato,
    required this.cliente,
    required this.codCli,
    required this.identificacoes,
  });
}

class TransacaoVenda {
  final int numTransVenda;
  final int numNota;
  final num? valor;

  TransacaoVenda({
    required this.numTransVenda,
    required this.numNota,
    this.valor,
  });
}
