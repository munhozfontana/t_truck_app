import 'package:get/get.dart';

import 'ui/page/client_detail_controller.dart';

class ClientDetailBiding extends Bindings {
  @override
  void dependencies() {
    Get.put(ClientDetailController());
  }
}
