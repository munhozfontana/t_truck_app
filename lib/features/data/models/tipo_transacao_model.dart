import 'dart:convert';

import 'package:t_truck_app/features/domain/entites/tipo_transacao_entity.dart';
import 'package:t_truck_app/features/domain/entites/transacao_venda_entity.dart';

class TipoTransacaoModel extends TipoTransacaoEntity {
  TipoTransacaoModel({
    required TipoTransacao tipoTransacao,
    required TransacaoVendaEntity transacaoVendaEntity,
  }) : super(
            tipoTransacao: tipoTransacao,
            transacaoVendaEntity: transacaoVendaEntity);

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
      transacaoVendaEntity: TransacaoVendaEntity(
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
