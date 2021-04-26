import 'package:rx_notifier/rx_notifier.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/credential.dart';
import 'package:t_truck_app/features/domain/use_cases/login/login_use_case.dart';
import 'package:t_truck_app/features/presentation/controllers/base_controller.dart';

class LoginController extends BaseController {
  final loginField = RxNotifier<String>('');
  final passwordField = RxNotifier<String>('');

  final LoginUseCase loginUseCase;

  LoginController({
    required this.loginUseCase,
  });

  void auth() async {
    changeLoading(Loading.START);
    var res = await loginUseCase(Params(
      credential:
          Credential(login: loginField.value, password: loginField.value),
    ));
    res
        .map(
          (r) => changeLoading(Loading.STOP),
        )
        .fold(
          (l) => null,
          (r) => null,
        );
  }
}
