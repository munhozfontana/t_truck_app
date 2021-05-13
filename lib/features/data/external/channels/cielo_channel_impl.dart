import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_truck_app/features/data/external/adapters/i_payment_external.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_channel.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';

enum Payment {
  DEBITO_AVISTA,
  DEBITO_PREDATADO,
  CREDITO_AVISTA,
  CREDITO_PARCELADO_LOJA,
  CREDITO_PARCELADO_ADM,
  PRE_AUTORIZACAO,
  VOUCHER_ALIMENTACAO,
  VOUCHER_REFEICAO,
  VISAVALE_REFEICAO,
  VISAVALE_ALIMENTACAO,
}

extension PaymentCode on Payment {
  int get code {
    switch (this) {
      case Payment.DEBITO_AVISTA:
        return 0x0101;
      case Payment.DEBITO_PREDATADO:
        return 0x0102;
      case Payment.CREDITO_AVISTA:
        return 0x0201;
      case Payment.CREDITO_PARCELADO_LOJA:
        return 0x0202;
      case Payment.CREDITO_PARCELADO_ADM:
        return 0x0203;
      case Payment.PRE_AUTORIZACAO:
        return 0x0301;
      case Payment.VOUCHER_ALIMENTACAO:
        return 0x0401;
      case Payment.VOUCHER_REFEICAO:
        return 0x0402;
      case Payment.VISAVALE_REFEICAO:
        return 0x0501;
      case Payment.VISAVALE_ALIMENTACAO:
        return 0x0502;
    }
  }
}

class CieloChannelImpl implements IPaymentExternal {
  @override
  Future<PaymentResponse> pay(List<OrderEntity> listOrderEntity) async {
    var arg = convertToCielo(listOrderEntity);

    var result = await CieloRun().pay(arg);
    return PaymentResponse(
      payments: result.payments,
      status: result.status,
    );
  }

  PayParam convertToCielo(List<OrderEntity> listOrderEntity) {
    var cieloCredentials = CieloCredentials()
      ..clientID = env['CLIENT_ID_CIELO']
      ..accessToken = env['ACCESS_TOKEN_CIELO'];

    var valorTotal = listOrderEntity
        .map((e) => e.identificacoes
            .map((e) => e.valor)
            .where((e) => e != null)
            .map((e) => currencyDefaultCielo(e!))
            .reduce((itemValue, item) => itemValue + item))
        .reduce((montanteValue, montante) => montanteValue + montante);

    var items = <Map>[];

    listOrderEntity.forEach((e) {
      var itemsConverted = e.identificacoes.map((item) {
        return {
          'sku': item.numNota,
          'name': e.cliente,
          'unitPrice': currencyDefaultCielo(item.valor ?? 0),
          'quantity': 1,
          'unitOfMeasure': item.numTransVenda.toString(),
        };
      });

      items.addAll(itemsConverted);
    });

    var arg = PayParam()
      ..reference = 'GSA'
      ..cieloCredentials = cieloCredentials
      ..valorTotal = valorTotal
      ..paymentCode = Payment.CREDITO_PARCELADO_ADM.code
      ..items = items;
    return arg;
  }

  int currencyDefaultCielo(double e) => (e * 100).toInt();
}
