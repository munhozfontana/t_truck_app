import 'package:rx_notifier/rx_notifier.dart';

enum Loading { START, STOP }

class BaseController {
  final loadingState = RxNotifier<Loading>(Loading.STOP);

  void changeLoading(Loading loading) {
    loadingState.value = loading;
  }
}
