import 'package:get/get.dart';
import 'package:t_truck_app/core/utils/base_controller.dart';
import 'package:t_truck_app/features/clients/list_clients/list_clients_biding.dart';
import 'package:t_truck_app/features/clients/list_clients/ui/page/list_client_controller.dart';
import 'package:t_truck_app/features/clients/list_clients/ui/page/list_client_page.dart';

class DevolutionFinishController extends GetxController with BaseController {
  void toListClients() {
    try {
      Get.find<ListClientController>().takeClients();
    } catch (e) {
      ListClientBiding().dependencies();
      Get.find<ListClientController>().takeClients();
    }

    Get.offAll(
      () => ListClientPage(),
      binding: ListClientBiding(),
    );
  }
}
