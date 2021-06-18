import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../features/clients/list_clients/data/models/client_model.dart';
import '../../features/payment/data/external/channels/cielo_channel.dart';

class PaymentUtils {
  // BUILD UTILS

  static CieloCredentials buildCieloCredentials() {
    var cieloCredentials = CieloCredentials()
      ..clientID = env['CLIENT_ID_CIELO']
      ..accessToken = env['ACCESS_TOKEN_CIELO'];
    return cieloCredentials;
  }

  static PayParam buildPayParam(
      CieloCredentials cieloCredentials, List<Map> items) {
    var arg = PayParam()
      ..reference = 'GSA'
      ..cieloCredentials = cieloCredentials
      ..items = items;

    return arg;
  }

  static List<Map> takeItems(ClientModel clientModel) {
    return clientModel.paymentTypeGsa!.map((item) {
      return {
        'sku': item.numTransVenda.toString(),
        'name': clientModel.name,
        'unitPrice': convensaoCielo(item.valorCartao!).toInt(),
        'quantity': 1,
        'unitOfMeasure': 'EACH',
      };
    }).toList();
  }

  static double convensaoCielo(num e) =>
      (100 * double.parse(e.toStringAsFixed(2)));
}
