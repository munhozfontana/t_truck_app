import 'package:get/get.dart';

enum Loading { START, STOP }

mixin BaseController on GetxController {
  final loadingState = Loading.STOP.obs;

  void changeLoading(Loading loading) {
    loadingState.value = loading;
  }
}
