import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/entites/tipo_transacao_entity.dart';
import 'package:t_truck_app/features/domain/entites/transacao_venda_entity.dart';
import 'package:t_truck_app/features/domain/use_cases/order/order_pay_use_case.dart';
import 'package:t_truck_app/features/presentation/pages/camera/camera_proof/camera_proof_page.dart';
import 'package:t_truck_app/features/presentation/pages/order/order_page.dart';
import 'package:t_truck_app/features/presentation/pages/product/product_controller.dart';
import 'package:t_truck_app/features/presentation/styles/app_dialog.dart';
import 'package:t_truck_app/injection_container.dart';

class PaymentController extends GetxController {
  OrderPayUseCase orderPayUseCase;

  Rx<OrderEntity> orderEntity = OrderEntity(
          cliente: '', codCli: 0, identificacoes: [], dtSaida: '', numCar: 0)
      .obs;

  RxString botaoDinamico = ''.obs;

  RxList<TipoTransacaoEntity> tipoTransacaoEntity = <TipoTransacaoEntity>[].obs;

  PaymentController({
    required this.orderPayUseCase,
  });

  @override
  void onInit() {
    super.onInit();

    tipoTransacaoEntity = Get.find<ProductController>().tipoTransacaoEntity;

    if (tipoTransacaoEntity.first.valorBoleto > 0) {
      botaoDinamico = 'Boleto bancário'.obs;
    }

    if (tipoTransacaoEntity.first.valorBonificado > 0) {
      botaoDinamico = 'Boníficado'.obs;
    }

    if (tipoTransacaoEntity.first.valorCarteira > 0) {
      botaoDinamico = 'Carteira'.obs;
    }
  }

  void payCartaoCredito() async {
    orderEntity.value = Get.arguments;

    (await orderPayUseCase(Params(
            orderEntity: orderEntity.value.copyWith(
                dtSaida: tipoTransacaoEntity.first.dtSaida,
                identificacoes: tipoTransacaoEntity
                    .map((element) => TransacaoVendaEntity(
                        numTransVenda:
                            element.transacaoVendaEntity.numTransVenda,
                        numNota: 0,
                        valor: tipoTransacaoEntity
                            .firstWhere((item) =>
                                item.transacaoVendaEntity.numTransVenda ==
                                element.transacaoVendaEntity.numTransVenda)
                            .valorCarteira,
                        prest: ''))
                    .toList()))))
        .fold((l) {
      AppDialog.error(menssagem: l.props.first.toString());
      Get.offAll(() => OrderPage(), binding: OrderBiding());
    }, (r) {
      AppDialog.show(menssagem: 'Pagamento relizado com sucesso');
      Get.to(() => CameraProofPage());
    });
  }

  void payDinamico() {
    Get.to(() => CameraProofPage());
  }
}
