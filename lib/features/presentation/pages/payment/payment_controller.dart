import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/use_cases/order/order_pay_use_case.dart';
import 'package:t_truck_app/features/presentation/pages/camera/camera_proof/camera_proof_page.dart';
import 'package:t_truck_app/features/presentation/pages/order/order_page.dart';
import 'package:t_truck_app/features/presentation/styles/app_dialog.dart';
import 'package:t_truck_app/injection_container.dart';

class PaymentController extends GetxController {
  OrderPayUseCase orderPayUseCase;

  Rx<OrderEntity> orderEntity = OrderEntity(
          cliente: '', codCli: 0, identificacoes: [], dtSaida: '', numCar: 0)
      .obs;

  PaymentController({
    required this.orderPayUseCase,
  });

  void pay() async {
    orderEntity.value = Get.arguments;

    (await orderPayUseCase(Params(orderEntity: orderEntity.value))).fold(
        // TODO: verificar na APP pq não vem error
        (l) {
      Get.offAll(() => OrderPage(), binding: OrderBiding());
      AppDialog.error(menssagem: l.props.first.toString());
    }, (r) {
      AppDialog.show(menssagem: 'Pagamento relizado com sucesso');
      Get.to(() => CameraProofPage());
    });
  }
}
