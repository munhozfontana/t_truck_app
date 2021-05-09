import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/credential_entity.dart';
import 'package:t_truck_app/features/domain/use_cases/login/login_use_case.dart';
import 'package:t_truck_app/features/domain/use_cases/token/token_use_case.dart';
import 'package:t_truck_app/features/presentation/pages/order/order_page.dart';
import 'package:t_truck_app/features/presentation/styles/app_dialog.dart';
import 'package:t_truck_app/features/presentation/utils/base_controller.dart';
import 'package:t_truck_app/injection_container.dart';

class LoginController extends GetxController with BaseController {
  final LoginUseCase loginUseCase;
  final TokenUseCase tokenUseCase;
  RxString matricula = ''.obs;

  LoginController({
    required this.loginUseCase,
    required this.tokenUseCase,
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
                  (r) => {
                        matricula.value = r['login'].toString(),
                        Get.to(() => OrderPage(), binding: OrderBiding())
                      }),
            });
  }
}
