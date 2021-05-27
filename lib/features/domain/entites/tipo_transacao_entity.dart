import 'package:t_truck_app/features/domain/entites/transacao_venda_entity.dart';

enum TipoTransacao { BOLETO, CREDITO, BOLETO_CREDITO, NONE }

class TipoTransacaoEntity {
  TransacaoVendaEntity transacaoVendaEntity;
  TipoTransacao tipoTransacao;
  String dtSaida;
  num valorBoleto;
  num valorBonificado;
  num valorCartao;
  num valorCarteira;

  TipoTransacaoEntity({
    required this.transacaoVendaEntity,
    required this.tipoTransacao,
    required this.dtSaida,
    required this.valorBoleto,
    required this.valorBonificado,
    required this.valorCartao,
    required this.valorCarteira,
  });
}
