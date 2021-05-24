import 'package:t_truck_app/features/domain/entites/transacao_venda_entity.dart';

class ProductEntity {
  final int codProd;
  final String descricao;
  final int qt;
  final TransacaoVendaEntity transacaoVendaEntity;

  int qtToSend;

  ProductEntity({
    required this.codProd,
    required this.descricao,
    required this.qt,
    required this.qtToSend,
    required this.transacaoVendaEntity,
  });
}
