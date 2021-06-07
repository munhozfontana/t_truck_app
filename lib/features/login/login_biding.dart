import 'package:get/get.dart';

import 'data/external/login_api.dart';
import 'data/repositories_impl/login_repository.dart';
import 'data/repositories_impl/token_repository.dart';
import 'domain/repositores/i_login_repository.dart';
import 'domain/repositores/i_token_repository.dart';
import 'domain/use_cases/login_use_case.dart';
import 'domain/use_cases/token_use_case.dart';
import 'ui/page/login_controller.dart';

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

    Get.lazyPut(
      () => LoginController(
        iLoggedUser: Get.find(),
        loginUseCase: Get.find(),
        tokenUseCase: Get.find(),
      ),
    );
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
