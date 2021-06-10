import 'package:get/get.dart';
import 'package:t_truck_app/features/clients/list_products/ui/page/list_products_controller.dart';

class LitProductsBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<ListProductsController>(ListProductsController());
  }
}
