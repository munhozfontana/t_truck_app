import 'dart:convert';

import 'package:t_truck_app/features/domain/entites/product_entity.dart';
import 'package:t_truck_app/features/domain/entites/transacao_venda_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required int codProd,
    required String descricao,
    required int qt,
    required TransacaoVendaEntity transacaoVendaEntity,
  }) : super(
            codProd: codProd,
            descricao: descricao,
            qt: qt,
            qtToSend: 0,
            transacaoVendaEntity: transacaoVendaEntity);

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
        codProd: map['CODPROD'],
        descricao: map['DESCRICAO'],
        qt: (map['QT'] as num).toInt(),
        transacaoVendaEntity: TransacaoVendaEntity(
          numNota: 0,
          numTransVenda: map['NUMTRANSVENDA'],
          prest: '',
        ));
  }

  static List<ProductModel> listFromJson(String? body) {
    List list = jsonDecode(body!);
    return list.map((order) {
      return ProductModel.fromMap(order);
    }).toList();
  }
}
