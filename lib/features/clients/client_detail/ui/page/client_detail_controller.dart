import 'package:get/get.dart';
import 'package:t_truck_app/features/clients/list_clients/data/models/clients_model.dart';

import '../../../../../core/utils/base_controller.dart';

class ClientDetailController extends GetxController with BaseController {
  Rx<ClientModel?> clientEntity = ClientModel(
    cliente: '',
    qtde: 0,
    codCli: 0,
  ).obs;

  @override
  void onInit() {
    changeLoading(Loading.START);
    clientEntity.value = Get.arguments;
    changeLoading(Loading.STOP);
    super.onInit();
  }
}
