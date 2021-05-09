class OrderEntity {
  final String? dtCanhato;
  final String cliente;
  final int codCli;
  final List<Identificacao> identificacoes;

  OrderEntity({
    this.dtCanhato,
    required this.cliente,
    required this.codCli,
    required this.identificacoes,
  });
}

class Identificacao {
  final int numTransVenda;
  final int numNota;

  Identificacao({
    required this.numTransVenda,
    required this.numNota,
  });
}
