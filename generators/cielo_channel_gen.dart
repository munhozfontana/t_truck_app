import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class CieloRun {
  void pay(PayParam param);

  @async
  PayResponse responsePayments();
}

class PayParam {
  final CieloCredentials cieloCredentials;
  final String reference;
  final List<Map<String, Object>> items;

  PayParam({
    required this.cieloCredentials,
    required this.reference,
    required this.items,
  });
}

class PayResponse {
  late int paidAmount;
  late List<Map> payments;
}

class CieloCredentials {
  final String clientID;
  final String accessToken;

  CieloCredentials({
    required this.clientID,
    required this.accessToken,
  });
}
