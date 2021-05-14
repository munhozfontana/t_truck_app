import 'dart:convert';

import 'package:t_truck_app/features/domain/entites/order_entity.dart';

class TransacaoVendaModel extends TransacaoVenda {
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

  static String toMapTransVenda(List<TransacaoVenda> list) {
    return json
        .encode({'NUMTRANSVENDA': list.map((e) => e.numTransVenda).toList()});
  }
}
