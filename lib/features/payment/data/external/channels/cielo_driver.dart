import 'package:get/get.dart';

import '../../../../../core/error/driver_exception.dart';
import 'cielo_channel.dart';

class CieloDriver {
  Future<PayResponse> payCielo(PayParam payParam) async {
    try {
      var pay = await CieloRun().pay(payParam);

      if (GetUtils.isNull(pay.id)) {
        throw DriverException();
      }

      return pay;
    } catch (e) {
      throw DriverException();
    }
  }
}
