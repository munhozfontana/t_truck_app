import 'package:get/get.dart';
import 'package:t_truck_app/features/clients/list_clients/domain/use_cases/clients_list_use_case.dart';
import 'package:t_truck_app/features/clients/list_clients/ui/page/list_client_controller.dart';

class ListClientBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ClientListUseCase(
        iClientsRepository: Get.find(),
      ),
    );

    Get.put<ListClientController>(ListClientController(
      iLoggedUser: Get.find(),
      clientsListUseCase: Get.find(),
    ));
  }
}
