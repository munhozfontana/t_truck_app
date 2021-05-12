import 'dart:convert';

import 'package:t_truck_app/features/domain/entites/order_entity.dart';

class IdentificacaoModel extends Identificacao {
  IdentificacaoModel({
    required int numTransVenda,
    required int numNota,
  }) : super(
          numTransVenda: numTransVenda,
          numNota: numNota,
        );

  static String toMapTransVenda(List<Identificacao> list) {
    return json
        .encode({'NUMTRANSVENDA': list.map((e) => e.numTransVenda).toList()});
  }
}
