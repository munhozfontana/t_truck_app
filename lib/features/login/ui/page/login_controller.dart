import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/clients/list_clients/ui/page/list_client_controller.dart';

import '../../../../core/adapters/protocols/i_logged_user.dart';
import '../../../../core/params/params.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/base_controller.dart';
import '../../../clients/list_clients/list_clients_biding.dart';
import '../../../clients/list_clients/ui/page/list_client_page.dart';
import '../../domain/entites/credential_entity.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../../domain/use_cases/token_use_case.dart';

class LoginController extends GetxController with BaseController {
  final LoginUseCase loginUseCase;
  final TokenUseCase tokenUseCase;
  final ILoggedUser iLoggedUser;

  LoginController({
    required this.loginUseCase,
    required this.tokenUseCase,
    required this.iLoggedUser,
  });

  var loginField = TextEditingController().obs;
  var passwordField = TextEditingController().obs;

  @override
  void onInit() async {
    await redirectWhenLoginNotExpired();
    super.onInit();
  }

  Future<void> redirectWhenLoginNotExpired() async {
    if (!(await iLoggedUser.loginExpired())) {
      tryGet();
      await Get.to(() => ListClientPage(), binding: ListClientBiding());
    }
  }

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
        (l) => AppUtils.error(
              menssagem: l.props.first.toString(),
            ),
        (r) => {
              tokenUseCase(Params(token: r)).fold(
                  (l) => AppUtils.error(
                        menssagem: l.props.first.toString(),
                      ),
                  (r) => {
                        tryGet(),
                        toOrderPage(),
                      }),
            });
  }

  void loginIfHasToken() {
    changeLoading(Loading.START);
    var expired = iLoggedUser.loginExpired();
    expired.then((value) {
      if (!value) {
        changeLoading(Loading.STOP);
        tryGet();
        toOrderPage();
      }
      changeLoading(Loading.STOP);
    });
  }

  void toOrderPage() =>
      Get.to(() => ListClientPage(), binding: ListClientBiding());

  void tryGet() {
    try {
      Get.find<ListClientController>().takeClients();
    } catch (e) {
      log('Bind não existente', error: e);
    }
  }
}
