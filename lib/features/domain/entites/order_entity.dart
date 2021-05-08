class OrderEntity {
  final String numTransVenda;
  final String dtCanhato;
  final int numNota;
  final String codCliCliente;
  final int codCli;

  OrderEntity(
      {required this.numTransVenda,
      required this.dtCanhato,
      required this.numNota,
      required this.codCliCliente,
      required this.codCli});
}
