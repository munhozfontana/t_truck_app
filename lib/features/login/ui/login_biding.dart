import 'package:get/get.dart';

import '../../../injection_container.dart';
import '../data/external/login_api.dart';
import '../data/repositories_impl/login_repository.dart';
import '../domain/repositores/i_login_repository.dart';
import '../domain/use_cases/login_use_case.dart';
import 'page/login_controller.dart';

class LoginBiding extends Bindings {
  @override
  void dependencies() {
    TokenBiding().dependencies();
    Get.lazyPut<ILogin>(
      () => LoginApi(iHttp: Get.find()),
    );

    Get.lazyPut<ILoginRepository>(
      () => LoginRepository(iLoginApi: Get.find()),
    );

    Get.lazyPut(
      () => LoginUseCase(
        iLocalStoreExternal: Get.find(),
        iLoginRepository: Get.find(),
      ),
    );

    Get.put(
      LoginController(
        iLoggedUser: Get.find(),
        loginUseCase: Get.find(),
        tokenUseCase: Get.find(),
      ),
    );
  }
}
