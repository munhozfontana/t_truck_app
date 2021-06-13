import 'package:get/get.dart';

import 'data/external/devolution_api.dart';
import 'data/repositories_impl/devolution_repository.dart';
import 'domain/repositories/i_devolution_repository.dart';
import 'domain/use_cases/devolution_list_use_case.dart';
import 'domain/use_cases/devolution_save_usecase.dart';
import 'ui/page/devolution_controller.dart';

class DevolutionBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IDevolutionExternal>(() => DevolutionApi(
          iHttp: Get.find(),
        ));
    Get.lazyPut<IDevolutionRepository>(() => DevolutionRepository(
          iOccurrenceExternal: Get.find(),
        ));
    Get.lazyPut(() => DevolutionListUseCase(
          iDevolutionRepository: Get.find(),
        ));
    Get.lazyPut(() => DevolutionSaveUseCase(
          iDevolutionSaveRepository: Get.find(),
          iLoggedUser: Get.find(),
        ));

    Get.put(DevolutionController(
      devolutionListUseCase: Get.find(),
      devolutionSaveUseCase: Get.find(),
    ));
  }
}
