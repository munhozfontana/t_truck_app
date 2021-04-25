import 'package:flutter/cupertino.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/use_cases/login/login_use_case.dart';

class LoginController extends ChangeNotifier {
  final LoginUseCase loginUseCase;

  LoginController({
    required this.loginUseCase,
  });

  login() {
    loginUseCase(Params());
  }
}
