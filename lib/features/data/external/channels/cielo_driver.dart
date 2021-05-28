import 'package:get/get.dart';
import 'package:t_truck_app/core/error/driver_exception.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_channel.dart';
import 'package:t_truck_app/features/presentation/styles/app_dialog.dart';

class CieloDriver {
  Future<PayResponse> payCielo(PayParam payParam) async {
    try {
      var pay = await CieloRun().pay(payParam);

      AppDialog.error(titulo: 'ERROR APP', menssagem: pay.error);

      if (GetUtils.isNull(pay.id)) {
        throw DriverException();
      }

      return pay;
    } catch (e) {
      throw DriverException();
    }
  }
}
