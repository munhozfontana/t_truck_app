import 'dart:async';

import 'package:rx_notifier/rx_notifier.dart';
import 'package:t_truck_app/features/domain/use_cases/login/login_use_case.dart';

enum Loading { START, STOP }

class BaseState {
  final loadingState = RxNotifier<Loading>(Loading.STOP);

  void changeLoading(Loading loading) {
    loadingState.value = loading;
  }
}

class LoginController extends BaseState {
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
