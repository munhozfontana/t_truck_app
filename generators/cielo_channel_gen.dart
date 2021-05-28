import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class CieloRun {
  @async
  PayResponse pay(PayParam param);

  PayResponse paySync(PayParam param);
}

class PayParam {
  final CieloCredentials cieloCredentials;
  final String reference;

  final String sku;
  final String description;
  final String unit_of_measure;
  final int unit_price;
  final int quantity;

  PayParam({
    required this.cieloCredentials,
    required this.reference,
    required this.sku,
    required this.description,
    required this.unit_of_measure,
    required this.unit_price,
    required this.quantity,
  });
}

class PayResponse {
  Map<String, dynamic>? orders;
  String? error;
}

class CieloCredentials {
  final String clientID;
  final String accessToken;

  CieloCredentials({
    required this.clientID,
    required this.accessToken,
  });
}
