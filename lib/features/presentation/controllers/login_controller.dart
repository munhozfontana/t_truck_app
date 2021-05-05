import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/credential.dart';
import 'package:t_truck_app/features/domain/use_cases/login/login_use_case.dart';
import 'package:t_truck_app/features/presentation/controllers/base_controller.dart';
import 'package:t_truck_app/features/presentation/pages/invoice_page.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;
  LoginController({required this.loginUseCase});

  final loadingState = Loading.STOP.obs;

  Rx<GlobalKey<FormState>> form = GlobalKey<FormState>().obs;

  var loginField = TextEditingController().obs;
  var passwordField = TextEditingController().obs;

  void changeLoading(Loading loading) {
    loadingState.value = loading;
  }

  void auth() async {
    changeLoading(Loading.START);
    form.value.currentState!.validate();
    var res = await loginUseCase(
      Params(
        credential: Credential(
          login: loginField.value.text,
          password: passwordField.value.text,
        ),
      ),
    );
    changeLoading(Loading.STOP);
    res.fold(
        (l) => {
              Get.snackbar('Titulo', l.props.first.toString(),
                  colorText: Colors.white,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.redAccent),
            },
        (r) async => await Get.to(() => InvoicePage()));
  }
}
