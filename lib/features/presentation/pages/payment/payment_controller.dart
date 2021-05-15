import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/use_cases/order/order_pay_use_case.dart';
import 'package:t_truck_app/features/presentation/styles/app_dialog.dart';

class PaymentController extends GetxController {
  OrderPayUseCase orderPayUseCase;

  PaymentController({
    required this.orderPayUseCase,
  });

  void pay() async {
    (await orderPayUseCase(Params(orderEntity: Get.arguments))).fold(
        // TODO: verificar na APP pq não vem error
        (l) => AppDialog.error(menssagem: 'error'),
        (r) => AppDialog.show(menssagem: 'Pagamento relizado com sucesso'));
  }
}
