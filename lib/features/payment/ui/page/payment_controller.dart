import 'package:get/get.dart';
import 'package:t_truck_app/features/domain/entites/clients.dart';
import 'package:t_truck_app/features/domain/entites/tipo_transacao_entity.dart';
import 'package:t_truck_app/features/domain/use_cases/order/order_pay_use_case.dart';
import 'package:t_truck_app/features/presentation/pages/camera/camera_proof/camera_proof_page.dart';
import 'package:t_truck_app/features/presentation/pages/product/product_controller.dart';
import 'package:t_truck_app/features/presentation/utils/base_controller.dart';

class PaymentController extends GetxController with BaseController {
  OrderPayUseCase orderPayUseCase;

  Rx<ClientEntity> orderEntity = ClientEntity().obs;
  RxList<TipoTransacaoEntity?> listTipoTransacao = <TipoTransacaoEntity>[].obs;

  PaymentController({
    required this.orderPayUseCase,
  });

  @override
  void onInit() async {
    changeLoading(Loading.START);
    listTipoTransacao = Get.find<ProductController>().tipoTransacaoEntity;

    listTipoTransacao
        .where((item) => item!.tipoTransacao == TipoTransacao.BOLETO)
        .isNotEmpty;
    super.onInit();
  }

  void payCredito() async {
    orderEntity.value = Get.arguments;
  }

  void payBoleto() {
    Get.to(() => CameraProofPage());
  }
}
