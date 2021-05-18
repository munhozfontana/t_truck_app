import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_jwt_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_local_store_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_login_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_occurrence_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_order_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_product_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_receipt_external.dart';
import 'package:t_truck_app/features/data/external/apis/login_api.dart';
import 'package:t_truck_app/features/data/external/apis/occurrence_api.dart';
import 'package:t_truck_app/features/data/external/apis/product_api.dart';
import 'package:t_truck_app/features/data/external/apis/receipt_api.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_driver.dart';
import 'package:t_truck_app/features/data/external/drivers/dio_driver.dart';
import 'package:t_truck_app/features/data/external/drivers/jwt_decoder_driver.dart';
import 'package:t_truck_app/features/data/external/drivers/shared_preferences_driver.dart';
import 'package:t_truck_app/features/data/repository/login_repository.dart';
import 'package:t_truck_app/features/data/repository/occurrence_repository.dart';
import 'package:t_truck_app/features/data/repository/payment_repository.dart';
import 'package:t_truck_app/features/data/repository/product_repository.dart';
import 'package:t_truck_app/features/data/repository/token_repository.dart';
import 'package:t_truck_app/features/domain/repositories/i_login_repository.dart';
import 'package:t_truck_app/features/domain/repositories/i_occurrence_repository.dart';
import 'package:t_truck_app/features/domain/repositories/i_product_repository.dart';
import 'package:t_truck_app/features/domain/repositories/i_token_repository.dart';
import 'package:t_truck_app/features/domain/use_cases/login/login_use_case.dart';
import 'package:t_truck_app/features/domain/use_cases/occurrence/occurrence_list_use_case.dart';
import 'package:t_truck_app/features/domain/use_cases/order/order_list_use_case.dart';
import 'package:t_truck_app/features/domain/use_cases/order/order_pay_use_case.dart';
import 'package:t_truck_app/features/domain/use_cases/product/product_list_use_case.dart';
import 'package:t_truck_app/features/domain/use_cases/token/token_use_case.dart';
import 'package:t_truck_app/features/presentation/pages/devolution/devolution_controller.dart';
import 'package:t_truck_app/features/presentation/pages/login/login_controller.dart';
import 'package:t_truck_app/features/presentation/pages/occurrence_reason/occurrence_reason_controller.dart';
import 'package:t_truck_app/features/presentation/pages/order/order_controller.dart';
import 'package:t_truck_app/features/presentation/pages/payment/payment_controller.dart';
import 'package:t_truck_app/features/presentation/pages/product/product_controller.dart';

import 'features/data/external/apis/order_api.dart';
import 'features/data/repository/order_repository.dart';
import 'features/domain/repositories/i_order_repository.dart';

class MainBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<IHttp>(DioDriver(dio: Dio()));
    Get.put<ILocalStoreExternal>(SharedPreferencesDriver());
    TokenBiding().dependencies();
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
    TokenBiding().dependencies();
    Get.lazyPut<IOrderExternal>(() => OrderApi(
          iHttp: Get.find(),
        ));

    Get.lazyPut<IOrderRepository>(() => OrderRepository(
        iOrderExternal: Get.find(),
        iJwt: Get.find(),
        iLocalStoreExternal: Get.find()));

    Get.lazyPut<OrderListUseCase>(() => OrderListUseCase(
          iOrderListRepository: Get.find(),
        ));
    Get.lazyPut(() {
      return OrderController(orderListUseCase: Get.find());
    });
  }
}

class OrderPayBiding extends Bindings {
  @override
  void dependencies() {
    TokenBiding().dependencies();

    Get.lazyPut<IReceiptExternal>(() => ReceiptApi());

    Get.lazyPut<IOrderExternal>(() => OrderApi(
          iHttp: Get.find(),
        ));

    Get.lazyPut<CieloDriver>(() => CieloDriver());

    Get.lazyPut<IOrderPaymentRepository>(
      () => PaymentRepository(
        cieloDriver: Get.find(),
        iOrderExternal: Get.find(),
        iReceiptExternal: Get.find(),
        iJwt: Get.find(),
        iLocalStoreExternal: Get.find(),
      ),
    );

    Get.lazyPut<OrderPayUseCase>(() => OrderPayUseCase(
          iOrderPayRepository: Get.find(),
        ));

    Get.lazyPut(() => OrderPayUseCase(iOrderPayRepository: Get.find()));

    Get.put(PaymentController(orderPayUseCase: Get.find()));
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
          iLocalStoreExternal: Get.find(),
          iLoginRepository: Get.find(),
        ));
    Get.lazyPut(() =>
        LoginController(loginUseCase: Get.find(), tokenUseCase: Get.find()));
  }
}

class DeliveryBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IProductExternal>(() => ProductApi(iHttp: Get.find()));

    Get.lazyPut<IProductRepository>(
        () => ProductRepository(iProductExternal: Get.find()));

    Get.lazyPut<ProductListUseCase>(
        () => ProductListUseCase(iProductRepository: Get.find()));

    Get.lazyPut(() {
      return ProductController(productListUseCase: Get.find());
    });
  }
}

class OccurrenceReasonBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IOccurrenceExternal>(() => OccurrenceApi(iHttp: Get.find()));

    Get.lazyPut<IOccurrenceRepository>(
        () => OccurrenceRepository(iOccurrenceExternal: Get.find()));

    Get.lazyPut<OccurrenceListUseCase>(
        () => OccurrenceListUseCase(iOccurrenceListRepository: Get.find()));

    Get.lazyPut(
        () => OccurrenceReasonController(occurrenceListUseCase: Get.find()));
  }
}

class DevolutionBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DevolutionController());
  }
}
