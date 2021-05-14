import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_channel.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_enum.dart';
import 'package:t_truck_app/features/data/models/transacao_venda_model.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel(
      {required String? dtCanhato,
      required String cliente,
      required int codCli,
      required List<TransacaoVendaModel> identificacao})
      : super(
            dtCanhato: dtCanhato,
            cliente: cliente,
            codCli: codCli,
            identificacoes: identificacao);

  static List<OrderModel> orderByIdentificacao(String value) {
    List list = jsonDecode(value);
    return list.map((order) {
      var identificacao = list
          .where(
            (element) => element['CODCLI'] == order['CODCLI'],
          )
          .map((e) => TransacaoVendaModel(
              numTransVenda: e['NUMTRANSVENDA'],
              numNota: e['NUMTRANSVENDA'],
              valor: e['VLTOTAL'],
              prest: ''))
          .toList();

      return OrderModel(
          dtCanhato: order['DTCANHOTO'],
          cliente: order['CLIENTE'],
          codCli: order['CODCLI'],
          identificacao: identificacao);
    }).toList();
  }

  static PayParam orderListToCielo(List<OrderEntity> listOrderEntity) {
    var cieloCredentials = _OrderModelUtils.buildCieloCredentials();

    var valorTotal = listOrderEntity
        .map(_OrderModelUtils.valorTotalFromOrder)
        .reduce((montanteValue, montante) => montanteValue + montante);

    return _OrderModelUtils.buildPayParam(
      cieloCredentials,
      valorTotal,
      _OrderModelUtils.takeItems(listOrderEntity),
    );
  }

  static PayParam orderToCielo(OrderEntity orderEntity) {
    var cieloCredentials = _OrderModelUtils.buildCieloCredentials();

    var valorTotal = _OrderModelUtils.valorTotalFromOrder(orderEntity);

    return _OrderModelUtils.buildPayParam(
        cieloCredentials,
        valorTotal,
        _OrderModelUtils.takeItems(
          [orderEntity],
        ));
  }
}

class _OrderModelUtils {
  // BUILD UTILS
  static int valorTotalFromOrder(OrderEntity orderEntity) {
    return orderEntity.identificacoes
        .map((e) => e.valor)
        .where((e) => e != null)
        .map((e) => (e ?? 0))
        .map((e) => e.toInt())
        .reduce((itemValue, item) => itemValue + item);
  }

  static CieloCredentials buildCieloCredentials() {
    var cieloCredentials = CieloCredentials()
      ..clientID = env['CLIENT_ID_CIELO']
      ..accessToken = env['ACCESS_TOKEN_CIELO'];
    return cieloCredentials;
  }

  static PayParam buildPayParam(
      CieloCredentials cieloCredentials, int valorTotal, List<Map> items) {
    var arg = PayParam()
      ..reference = 'GSA'
      ..cieloCredentials = cieloCredentials
      ..valorTotal = valorTotal
      ..paymentCode = Payment.CREDITO_PARCELADO_ADM.code
      ..items = items;
    return arg;
  }

  static List<Map> takeItems(List<OrderEntity> listOrderEntity) {
    var items = <Map>[];

    listOrderEntity.forEach((e) {
      var itemsConverted = e.identificacoes.map((item) {
        return {
          'sku': item.numNota.toString(),
          'name': e.cliente,
          'unitPrice': item.valor!.toInt(),
          'quantity': 1,
          'unitOfMeasure': item.numTransVenda.toString(),
        };
      });

      items.addAll(itemsConverted);
    });
    return items;
  }
}
