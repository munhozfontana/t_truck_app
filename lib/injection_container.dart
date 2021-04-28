import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http.dart';
import 'package:t_truck_app/features/data/external/adapters/i_login.dart';
import 'package:t_truck_app/features/data/external/apis/login_api.dart';
import 'package:t_truck_app/features/data/external/drivers/dio_driver.dart';
import 'package:t_truck_app/features/data/repository/login_repository.dart';
import 'package:t_truck_app/features/domain/repositories/i_login_repository.dart';
import 'package:t_truck_app/features/domain/use_cases/login/login_use_case.dart';
import 'package:t_truck_app/features/presentation/controllers/login_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHttp>(() => DioDriver(dio: Dio()));
    Get.lazyPut<ILogin>(() => LoginApi(iHttp: Get.find()));
    Get.lazyPut<ILoginRepository>(() => LoginRepository(iLoginApi: Get.find()));
    Get.lazyPut<LoginUseCase>(() => LoginUseCase(iLoginRepository: Get.find()));
    Get.put(LoginController(loginUseCase: Get.find()));
  }
}
