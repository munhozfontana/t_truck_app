import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_channel.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';

class PaymentUtils {
  // BUILD UTILS
  static int valorTotalFromOrder(OrderEntity orderEntity) {
    var listInts = orderEntity.identificacoes
        .map((e) => e.valor)
        .map((e) => (e ?? 0))
        .map((e) => convensaoCielo(e));
    return listInts.reduce((itemValue, item) => itemValue + item).toInt();
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
      ..items = items;

    return arg;
  }

  static List<Map> takeItems(List<OrderEntity> listOrderEntity) {
    var items = <Map>[];

    listOrderEntity.forEach((e) {
      var itemsConverted = e.identificacoes.map((item) {
        return {
          'sku': item.numTransVenda.toString(),
          'name': e.cliente,
          'unitPrice': convensaoCielo(item.valor!).toInt(),
          'quantity': 1,
          'unitOfMeasure': 'EACH',
        };
      });

      items.addAll(itemsConverted);
    });
    return items;
  }

  static double convensaoCielo(num e) =>
      (100 * double.parse(e.toStringAsFixed(2)));
}
