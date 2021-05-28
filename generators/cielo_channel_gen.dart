import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class CieloRun {
  @async
  PayResponse pay(PayParam param);
}

class PayParam {
  final CieloCredentials cieloCredentials;
  final int valorTotal;
  final String reference;
  final List<Map<String, Object>> items;
  final String? ec;
  final int? installments;
  final String? email;

  /// [Payment] use this type of payment
  final int paymentCode;

  PayParam({
    required this.cieloCredentials,
    required this.valorTotal,
    required this.reference,
    required this.items,
    this.ec,
    this.installments,
    this.email,
    required this.paymentCode,
  });
}

/// [status]
///  DRAFT == 0,
///  ENTERED == 1,
///  CANCELED == 2,
///  PAID == 3,
///  APPROVED == 4,
///  REJECTE == 5,
///  RE_ENTERED == 6,
///  CLOSED == 7

/// /// [type]
///  PAYMENT == 0,
///  AUTHORIZATION == 1

/// [payments] list with
/// externalId: String
/// description: String
/// cieloCode: String
/// authCode: String
/// brand: String
/// mask: String
/// terminal: String
/// amount: Long
/// primaryCode: String
/// secondaryCode: String
/// applicationName: String
/// requestDate: String
/// merchantCode: String
/// discountedAmount: Long
/// installments: Long
/// paymentFields: Map<String, String>
/// accessKey: String

class PayResponse {
  late String id;
  late int price;
  late int paidAmount;
  late int pendingAmount;
  late String reference;
  late String number;
  late String notes;
  late int status;
  late List<Map> items;
  late List<Map> payments;
  late int createdAt;
  late int updatedAt;
  int? releaseDate;
  int? type;
  late String? error;
}

// -------------

class CieloCredentials {
  final String clientID;
  final String accessToken;

  CieloCredentials({
    required this.clientID,
    required this.accessToken,
  });
}

/// This class is a Item that is sold within an order
///
/// [sku] sku the id of the item
/// [name] the name of the item
/// [unitPrice] the unit price of the item
/// [quantity] the quantity of the item
/// [unitOfMeasure] => the unit of measure of the item e.g.: ml, kg, unit
///

// class Item {
//   final String sku;
//   final String name;
//   final double unitPrice;
//   final int quantity;
//   final String unitOfMeasure;

//   Item({
//     required this.sku,
//     required this.name,
//     required this.unitPrice,
//     required this.quantity,
//     required this.unitOfMeasure,
//   });
// }

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

// EXEMPLO DE CHAMADA NO DART 
// void getCielo() async {
//   CieloCredentials cieloCredentials = CieloCredentials(
//     clientID: '8L24NGKvA1ZqIITT10GcV6Iln2vi5qaNuvyoVUwDMaqUfr8tq2',
//     accessToken: 'tYVLDVObE71O49xiGfOoSz2fEwS61uTKUR3wvn0B8KSlMHcFpl',
//   );

//   PayParam arg = PayParam(
//       reference: 'MINHA REFERENCIA FLUTTER',
//       cieloCredentials: cieloCredentials,
//       valorTotal: 500000,
//       paymentCode: Payment.CREDITO_PARCELADO_ADM.code,
//       installments: 5,
//       items: [
//         {
//           'sku': '2891820317391823',
//           'name': 'coca',
//           'unitPrice': 550,
//           'quantity': 1,
//           'unitOfMeasure': 'UNIT',
//         }
//       ]);

//   PayResponse res = await CieloRun().pay(param);
//   print(res);
// }
