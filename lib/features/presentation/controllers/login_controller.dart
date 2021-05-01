import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/credential.dart';
import 'package:t_truck_app/features/domain/use_cases/login/login_use_case.dart';
import 'package:t_truck_app/features/presentation/controllers/base_controller.dart';
import 'package:t_truck_app/features/presentation/pages/order_list.dart';

class LoginController extends RxController {
  final LoginUseCase loginUseCase;
  LoginController({required this.loginUseCase});

  final loadingState = Loading.STOP.obs;
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  var loginField = TextEditingController();
  var passwordField = TextEditingController();

  void changeLoading(Loading loading) {
    loadingState.value = loading;
  }

  void auth() async {
    changeLoading(Loading.START);
    keyForm.currentState!.validate();

    var res = await loginUseCase(
      Params(
        credential: Credential(
          login: loginField.text,
          password: passwordField.text,
        ),
      ),
    );
    changeLoading(Loading.STOP);
    res.fold(
        (l) => {
              Get.snackbar(
                'Titulo',
                l.props.first.toString(),
                colorText: Colors.blueAccent,
                snackPosition: SnackPosition.BOTTOM,
              ),
            },
        (r) async => await Get.to(OrderList()));
  }
}
