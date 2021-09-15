import 'package:get/get.dart';

import './global_store_controller.dart';

class GlobalStoreBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(GlobalStoreController(), permanent: true);
  }
}
