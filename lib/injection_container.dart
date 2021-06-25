import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/geolocation/geolocation_biding.dart';

import 'core/adapters/drivers/dio_driver.dart';
import 'core/adapters/drivers/jwt_decoder_driver.dart';
import 'core/adapters/drivers/shared_preferences_driver.dart';
import 'core/adapters/protocols/i_http_external.dart';
import 'core/adapters/protocols/i_jwt_external.dart';
import 'core/adapters/protocols/i_local_store_external.dart';
import 'core/adapters/protocols/i_logged_user.dart';
import 'features/login/login_biding.dart';

class MainBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<ILocalStoreExternal>(
      SharedPreferencesDriver(),
      permanent: true,
    );
    Get.put<IJwt>(
      JwtDecoderDriver(),
      permanent: true,
    );
    Get.put<ILoggedUser>(
      LoggedUser(
        iJwt: Get.find(),
        iLocalStoreExternal: Get.find(),
      ),
      permanent: true,
    );
    Get.put<IHttp>(DioDriver(
      dio: Dio(BaseOptions(
          connectTimeout: 15 * 1000, // 60 seconds
          receiveTimeout: 15 * 1000 // 60 seconds
          )),
      iLoggedUser: Get.find(),
    ));
    TokenBiding().dependencies();
    GeolocationBiding().dependencies();
  }
}
