import 'package:t_truck_app/core/error/driver_exception.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_channel.dart';

class CieloDriver {
  Future<PayResponse> payCielo(PayParam payParam) {
    try {
      return CieloRun().pay(payParam);
    } catch (e) {
      throw DriverException();
    }
  }
}
