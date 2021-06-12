import 'package:get/get.dart';

import 'ui/page/list_products_controller.dart';

class LitProductsBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<ListProductsController>(ListProductsController());
  }
}
