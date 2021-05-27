import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/adapters/protocols/i_logged_user.dart';
import '../../../../core/params/params.dart';
import '../../../../core/utils/app_dialog.dart';
import '../../../../core/utils/base_controller.dart';
import '../../../../injection_container.dart';
import '../../../clients/list_products/ui/page/list_products_page.dart';
import '../../domain/entites/credential_entity.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../../domain/use_cases/token_use_case.dart';

class LoginController extends GetxController with BaseController {
  final LoginUseCase loginUseCase;
  final TokenUseCase tokenUseCase;
  final ILoggedUser iLoggedUser;
  RxString matricula = ''.obs;

  LoginController({
    required this.loginUseCase,
    required this.tokenUseCase,
    required this.iLoggedUser,
  });

  var loginField = TextEditingController().obs;
  var passwordField = TextEditingController().obs;

  void auth() async {
    changeLoading(Loading.START);
    var res = await loginUseCase(
      Params(
        credential: CredentialEntity(
          login: loginField.value.text,
          password: passwordField.value.text,
        ),
      ),
    );
    changeLoading(Loading.STOP);

    res.fold(
        (l) => AppDialog.error(
              menssagem: l.props.first.toString(),
            ),
        (r) => {
              tokenUseCase(Params(token: r)).fold(
                  (l) => AppDialog.error(
                        menssagem: l.props.first.toString(),
                      ),
                  (r) =>
                      {matricula.value = r['login'].toString(), toOrderPage()}),
            });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    // loginIfHasToken();
    super.onReady();
  }

  void toOrderPage() => Get.to(() => ListProductsPage(),
      binding: ListClientBiding(), arguments: true);

  void loginIfHasToken() {
    changeLoading(Loading.START);
    var expired = iLoggedUser.loginExpired();
    expired.then((value) {
      if (!value) {
        changeLoading(Loading.STOP);
        toOrderPage();
      }
      changeLoading(Loading.STOP);
    });
  }
}
