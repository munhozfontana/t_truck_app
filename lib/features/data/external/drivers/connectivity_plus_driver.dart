import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:t_truck_app/core/error/driver_exception.dart';
import 'package:t_truck_app/features/data/external/adapters/i_connectivity.dart';

class ConnectivityPlusDirver implements IConnectivity {
  Connectivity connectivity;

  ConnectivityPlusDirver({
    required this.connectivity,
  });

  @override
  Future<bool> isConnected() async {
    try {
      var connectivityResult = await (connectivity.checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        return true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw DriverException(error: e.toString());
    }
  }
}
