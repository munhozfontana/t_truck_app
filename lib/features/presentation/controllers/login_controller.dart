import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/credential.dart';
import 'package:t_truck_app/features/domain/use_cases/login/login_use_case.dart';
import 'package:t_truck_app/features/presentation/controllers/base_controller.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;
  LoginController({required this.loginUseCase});

  var loadingState = Loading.STOP.obs;
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  var loginField = TextEditingController();
  var passwordField = TextEditingController();

  void changeLoading(Loading loading) {
    loadingState.value = loading;
  }

  void auth() async {
    print('Tete');
    changeLoading(Loading.START);
    await loginUseCase(
      Params(
        credential:
            Credential(login: loginField.text, password: passwordField.text),
      ),
    );
    Timer(Duration(seconds: 2),
        () => {changeLoading(Loading.STOP), print('Tete 2')});
  }
}
