import 'dart:convert';

import 'package:t_truck_app/features/domain/entites/tipo_transacao_entity.dart';
import 'package:t_truck_app/features/domain/entites/transacao_venda_entity.dart';

class TipoTransacaoModel extends TipoTransacaoEntity {
  TipoTransacaoModel({
    required TipoTransacao tipoTransacao,
    required TransacaoVendaEntity transacaoVendaEntity,
    required String dtSaida,
    required num valorBoleto,
    required num valorBonificado,
    required num valorCartao,
    required num valorCarteira,
  }) : super(
          tipoTransacao: tipoTransacao,
          transacaoVendaEntity: transacaoVendaEntity,
          dtSaida: dtSaida,
          valorBoleto: valorBoleto,
          valorBonificado: valorBonificado,
          valorCartao: valorCartao,
          valorCarteira: valorCarteira,
        );

  factory TipoTransacaoModel.fromMap(Map<String, dynamic> map) {
    var tipoTransacao = TipoTransacao.NONE;

    if (map['ISCARTAO']) {
      tipoTransacao = TipoTransacao.CREDITO;
    }

    if (map['ISBOLETO']) {
      tipoTransacao = TipoTransacao.BOLETO;
    }

    if (map['ISCARTAO'] && map['ISBOLETO']) {
      tipoTransacao = TipoTransacao.BOLETO_CREDITO;
    }

    return TipoTransacaoModel(
      dtSaida: map['DTSAIDA'],
      valorCartao: map['VALORCARTAO'],
      valorBoleto: map['VALORBOLETO'],
      valorBonificado: map['VALORBONIFICADO'],
      valorCarteira: map['VALORCARTEIRA'],
      transacaoVendaEntity: TransacaoVendaEntity(
        valor: tipoTransacao == TipoTransacao.BOLETO
            ? map['VALORBOLETO']
            : map['VALORCARTAO'],
        numTransVenda: map['NUMTRANSVENDA'],
        numNota: 0,
        prest: '',
      ),
      tipoTransacao: tipoTransacao,
    );
  }

  factory TipoTransacaoModel.fromJson(String source) =>
      TipoTransacaoModel.fromMap(
        json.decode(source),
      );

  static Future<List<TipoTransacaoEntity>> fromJsonList(String value) async {
    List list = jsonDecode(value);
    return list.map((e) => TipoTransacaoModel.fromMap(e)).toList();
  }
}
