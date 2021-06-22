import 'package:get/get.dart';

import 'data/external/clients_api.dart';
import 'data/repositories_impl/clients_repository.dart';
import 'domain/repositores/i_clients_repository.dart';
import 'domain/use_cases/clients_list_use_case.dart';
import 'ui/page/list_client_controller.dart';

class ListClientBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IClientAdapter>(
      () => ClientsApi(iHttp: Get.find(), iLoggedUser: Get.find()),
    );

    Get.lazyPut<IClientsRepository>(
      () => ClientsRepository(
        iClientAdapter: Get.find(),
      ),
    );

    Get.lazyPut(
      () => ClientListUseCase(
        iClientsRepository: Get.find(),
      ),
    );

    Get.put<ListClientController>(
        ListClientController(
          clientsListUseCase: Get.find(),
        ),
        permanent: true);
  }
}
