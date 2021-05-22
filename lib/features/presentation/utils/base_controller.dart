import 'package:get/get.dart';

enum Loading { START, STOP, NONE }

mixin BaseController on GetxController {
  final loadingState = Loading.NONE.obs;

  void changeLoading(Loading loading) {
    loadingState.value = loading;
    loadingState.refresh();
  }

  bool get isLoading => loadingState.value == Loading.START;
}
