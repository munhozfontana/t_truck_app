import 'package:get/get.dart';

import '../../../../core/utils/base_controller.dart';

class PaymentController extends GetxController with BaseController {
  // OrderPayUseCase orderPayUseCase;

  // Rx<ClientEntity> orderEntity = ClientEntity().obs;
  // RxList<TipoTransacaoEntity?> listTipoTransacao = <TipoTransacaoEntity>[].obs;

  // PaymentController({
  //   required this.orderPayUseCase,
  // });

  @override
  void onInit() async {
    // changeLoading(Loading.START);
    // listTipoTransacao = Get.find<ProductController>().tipoTransacaoEntity;

    // listTipoTransacao
    //     .where((item) => item!.tipoTransacao == TipoTransacao.BOLETO)
    //     .isNotEmpty;
    super.onInit();
  }

  void payCredito() async {
    // orderEntity.value = Get.arguments;
  }

  void payBoleto() {
    // Get.to(() => CameraProofPage());
  }
}
