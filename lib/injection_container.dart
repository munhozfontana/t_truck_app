import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_jwt_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_login_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_order_external.dart';
import 'package:t_truck_app/features/data/external/apis/login_api.dart';
import 'package:t_truck_app/features/data/external/drivers/dio_driver.dart';
import 'package:t_truck_app/features/data/external/drivers/jwt_decoder_driver.dart';
import 'package:t_truck_app/features/data/repository/login_repository.dart';
import 'package:t_truck_app/features/data/repository/token_repository.dart';
import 'package:t_truck_app/features/domain/repositories/i_login_repository.dart';
import 'package:t_truck_app/features/domain/repositories/i_token_repository.dart';
import 'package:t_truck_app/features/domain/use_cases/login/login_use_case.dart';
import 'package:t_truck_app/features/domain/use_cases/order/order_list_use_case.dart';
import 'package:t_truck_app/features/domain/use_cases/token/token_use_case.dart';
import 'package:t_truck_app/features/presentation/pages/login/login_controller.dart';
import 'package:t_truck_app/features/presentation/pages/order/order_controller.dart';

import 'features/data/external/apis/order_external_api.dart';
import 'features/data/repository/order_repository.dart';
import 'features/domain/repositories/i_order_repository.dart';

class MainBiding extends Bindings {
  var globalKey = GlobalKey<FormState>();
  @override
  void dependencies() {
    Get.put<IHttp>(DioDriver(dio: Dio()));
    TokenBiding().dependencies();
    // OrderBiding().dependencies();
    LoginBiding().dependencies();
  }
}

class TokenBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IJwt>(
      () => JwtDecoderDriver(),
    );
    Get.lazyPut<ITokenRepository>(() => TokenRepository(
          jwtDriver: Get.find(),
        ));
    Get.lazyPut<TokenUseCase>(() => TokenUseCase(
          tokenRepository: Get.find(),
        ));
  }
}

class OrderBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IOrderExternal>(() => OrderExternalApi(
          iHttp: Get.find(),
        ));
    Get.lazyPut<IOrderRepository>(() => OrderRepository(
          iOrderExternal: Get.find(),
        ));
    Get.lazyPut<OrderListUseCase>(() => OrderListUseCase(
          iOrderListRepository: Get.find(),
        ));
    Get.lazyPut(() {
      return OrderController(orderListUseCase: Get.find());
    });
  }
}

class LoginBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILogin>(() => LoginApi(
          iHttp: Get.find(),
        ));
    Get.lazyPut<ILoginRepository>(() => LoginRepository(
          iLoginApi: Get.find(),
        ));
    Get.lazyPut<LoginUseCase>(() => LoginUseCase(
          iLoginRepository: Get.find(),
        ));
    Get.lazyPut(() {
      return LoginController(
          loginUseCase: Get.find(), tokenUseCase: Get.find());
    });
  }
}
