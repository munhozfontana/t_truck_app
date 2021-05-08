import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/credential_entity.dart';
import 'package:t_truck_app/features/domain/use_cases/login/login_use_case.dart';
import 'package:t_truck_app/features/presentation/pages/order/order_page.dart';
import 'package:t_truck_app/features/presentation/styles/app_snackbar.dart';
import 'package:t_truck_app/features/presentation/utils/base_controller.dart';

class LoginController extends GetxController with BaseController {
  final LoginUseCase loginUseCase;
  LoginController({required this.loginUseCase});

  Rx<GlobalKey<FormState>> form = GlobalKey<FormState>().obs;

  var loginField = TextEditingController().obs;
  var passwordField = TextEditingController().obs;

  void auth() async {
    changeLoading(Loading.START);
    form.value.currentState!.validate();
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
        (r) async => await Get.to(() => OrderPage()));
  }
}
