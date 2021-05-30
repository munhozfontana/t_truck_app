import 'package:t_truck_app/features/data/external/channels/cielo_channel.dart';

class CieloDriver {
  Future<PayResponse> payCielo(PayParam payParam) async {
    var pay = await CieloRun().pay(payParam);

    return pay;
  }
}
