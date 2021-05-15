import 'package:t_truck_app/features/domain/entites/transacao_venda_entity.dart';

class OrderEntity {
  final String? dtCanhato;
  final String cliente;
  final int codCli;
  final List<TransacaoVendaEntity> identificacoes;

  OrderEntity({
    this.dtCanhato,
    required this.cliente,
    required this.codCli,
    required this.identificacoes,
  });
}
