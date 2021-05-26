import 'package:t_truck_app/features/domain/entites/transacao_venda_entity.dart';

enum TipoTransacao { BOLETO, CREDITO, BOLETO_CREDITO, NONE }

class TipoTransacaoEntity {
  TransacaoVendaEntity transacaoVendaEntity;
  TipoTransacao tipoTransacao;

  TipoTransacaoEntity({
    required this.transacaoVendaEntity,
    required this.tipoTransacao,
  });
}
