import 'dart:convert';

import 'package:t_truck_app/features/domain/entites/transacao_venda_entity.dart';

class TransacaoVendaModel extends TransacaoVendaEntity {
  TransacaoVendaModel({
    required int numTransVenda,
    required int numNota,
    required num? valor,
    required String? prest,
  }) : super(
          numTransVenda: numTransVenda,
          numNota: numNota,
          valor: valor,
        );

  static String toMapTransVenda(List<TransacaoVendaEntity> list) {
    return json
        .encode({'NUMTRANSVENDA': list.map((e) => e.numTransVenda).toList()});
  }
}
