import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/adapters/drivers/connectivity_plus_driver.dart';
import 'package:t_truck_app/core/adapters/protocols/i_connectivity_external.dart';
import 'package:t_truck_app/core/components/app_drawer/app_drawer_bindings.dart';
import 'package:t_truck_app/core/global_store/global_store_bindings.dart';
import 'package:t_truck_app/core/interceptors/app_interceptor.dart';
import 'package:t_truck_app/features/chat/ui/chat_biding.dart';
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

    Get.put<IConnectivity>(
      ConnectivityPlusDirver(
        connectivity: Connectivity(),
      ),
      permanent: true,
    );

    Get.lazyPut(
      () => AppInterceptor(),
    );

    Get.lazyPut<IHttp>(
      () => DioDriver(
        interceptors: AppInterceptor().allInterceptor(),
        dio: Dio(BaseOptions(
          connectTimeout:
              const Duration(seconds: 5).inMilliseconds, // 60 seconds
          receiveTimeout:
              const Duration(seconds: 5).inMilliseconds, // 60 seconds
        )),
      ),
    );

    TokenBiding().dependencies();
    GeolocationBiding().dependencies();
    GlobalStoreBindings().dependencies();
    ChatBiding().dependencies();
    AppDrawerBindings().dependencies();
  }
}
