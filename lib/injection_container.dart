import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/clients/list_products/ui/page/list_products_controller.dart';

import 'core/adapters/drivers/dio_driver.dart';
import 'core/adapters/drivers/jwt_decoder_driver.dart';
import 'core/adapters/drivers/shared_preferences_driver.dart';
import 'core/adapters/protocols/i_http_external.dart';
import 'core/adapters/protocols/i_jwt_external.dart';
import 'core/adapters/protocols/i_local_store_external.dart';
import 'core/adapters/protocols/i_logged_user.dart';
import 'features/login/data/repositories_impl/token_repository.dart';
import 'features/login/domain/repositores/i_token_repository.dart';
import 'features/login/domain/use_cases/token_use_case.dart';

class MainBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<IHttp>(DioDriver(
      dio: Dio(BaseOptions(
          connectTimeout: 15 * 1000, // 60 seconds
          receiveTimeout: 15 * 1000 // 60 seconds
          )),
    ));
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
    TokenBiding().dependencies();
  }
}

class TokenBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<ITokenRepository>(
      TokenRepository(jwtDriver: Get.find()),
      permanent: true,
    );
    Get.put<TokenUseCase>(
      TokenUseCase(tokenRepository: Get.find()),
      permanent: true,
    );
  }
}

class ListClientBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListProductsController>(() => ListProductsController());
  }
}

class OrderPayBiding extends Bindings {
  @override
  void dependencies() {}
}

class DeliveryBiding extends Bindings {
  @override
  void dependencies() {}
}

class DevolutionReasonBiding extends Bindings {
  @override
  void dependencies() {}
}

class OccurrenceReasonBiding extends Bindings {
  @override
  void dependencies() {
    DevolutionReasonBiding().dependencies();
  }
}

class CameraImageBiding extends Bindings {
  @override
  void dependencies() {}
}

class DevolutionBiding extends Bindings {
  @override
  void dependencies() {}
}
