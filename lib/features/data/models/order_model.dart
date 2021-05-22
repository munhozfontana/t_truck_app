import 'dart:convert';

import 'package:t_truck_app/core/utils/payment_utils.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_channel.dart';
import 'package:t_truck_app/features/data/models/transacao_venda_model.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel(
      {required String? dtCanhato,
      required String cliente,
      required int codCli,
      required int numCar,
      required String dtSaida,
      required List<TransacaoVendaModel> identificacao})
      : super(
            dtCanhato: dtCanhato,
            cliente: cliente,
            codCli: codCli,
            numCar: numCar,
            dtSaida: dtSaida,
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
          dtSaida: order['DTSAIDA'],
          dtCanhato: order['DTCANHOTO'],
          cliente: order['CLIENTE'],
          codCli: order['CODCLI'],
          numCar: order['NUMCAR'],
          identificacao: identificacao);
    }).toList();
  }

  static PayParam orderListToCielo(List<OrderEntity> listOrderEntity) {
    var cieloCredentials = PaymentUtils.buildCieloCredentials();

    var valorTotal = listOrderEntity
        .map(PaymentUtils.valorTotalFromOrder)
        .reduce((montanteValue, montante) => montanteValue + montante);

    return PaymentUtils.buildPayParam(
      cieloCredentials,
      valorTotal,
      PaymentUtils.takeItems(listOrderEntity),
    );
  }

  static PayParam orderToCielo(OrderEntity orderEntity) {
    var cieloCredentials = PaymentUtils.buildCieloCredentials();
    var valorTotal = PaymentUtils.valorTotalFromOrder(orderEntity);
    return PaymentUtils.buildPayParam(
        cieloCredentials,
        valorTotal,
        PaymentUtils.takeItems(
          [orderEntity],
        ));
  }
}
