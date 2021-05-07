import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_login_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_order_external.dart';
import 'package:t_truck_app/features/data/external/apis/login_api.dart';
import 'package:t_truck_app/features/data/external/apis/order_external_api.dart';
import 'package:t_truck_app/features/data/external/drivers/dio_driver.dart';
import 'package:t_truck_app/features/data/repository/login_repository.dart';
import 'package:t_truck_app/features/data/repository/order_repository.dart';
import 'package:t_truck_app/features/domain/repositories/i_login_repository.dart';
import 'package:t_truck_app/features/domain/repositories/i_order_repository.dart';
import 'package:t_truck_app/features/domain/use_cases/Order/Order_list_use_case.dart';
import 'package:t_truck_app/features/domain/use_cases/login/login_use_case.dart';

class MainBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<IHttp>(DioDriver(dio: Dio()));
    loginBiding();
    OrderBiding();
  }

  void OrderBiding() {
    Get.put<IOrderExternal>(OrderExternalApi(iHttp: Get.find()));
    Get.put<IOrderRepository>(OrderRepository(iOrderExternal: Get.find()));
    Get.put<OrderListUseCase>(
        OrderListUseCase(iOrderListRepository: Get.find()));
  }

  void loginBiding() {
    Get.put<ILogin>(LoginApi(iHttp: Get.find()));
    Get.put<ILoginRepository>(LoginRepository(iLoginApi: Get.find()));
    Get.put<LoginUseCase>(LoginUseCase(iLoginRepository: Get.find()));
  }
}
