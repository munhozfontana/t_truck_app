import 'package:get/get.dart';

import '../../../../../core/utils/base_controller.dart';
import '../../../list_clients/data/models/client_model.dart';

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
