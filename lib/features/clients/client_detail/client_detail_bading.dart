import 'package:get/get.dart';
import 'package:t_truck_app/features/clients/client_detail/ui/page/client_detail_controller.dart';

class ClientDetailBiding extends Bindings {
  @override
  void dependencies() {
    Get.put(ClientDetailController());
  }
}
