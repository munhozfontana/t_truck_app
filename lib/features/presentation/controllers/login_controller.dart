import 'dart:async';

import 'package:rx_notifier/rx_notifier.dart';
import 'package:t_truck_app/features/domain/use_cases/login/login_use_case.dart';
import 'package:t_truck_app/features/presentation/controllers/base_controller.dart';

class LoginController extends BaseController {
  final loginField = RxNotifier<String>('');
  final passwordField = RxNotifier<String>('');

  final LoginUseCase loginUseCase;

  LoginController({
    required this.loginUseCase,
  });

  void auth() {
    changeLoading(Loading.START);
    Timer(Duration(seconds: 5), () {
      changeLoading(Loading.STOP);
    });
    // loginUseCase(Params(
    //   credential: Credential(login: loginField.value, pass: loginField.value),
    // ));
  }
}
