import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/use_cases/order/order_pay_use_case.dart';
import 'package:t_truck_app/features/presentation/pages/order/order_page.dart';
import 'package:t_truck_app/features/presentation/styles/app_dialog.dart';
import 'package:t_truck_app/injection_container.dart';

class PaymentController extends GetxController {
  OrderPayUseCase orderPayUseCase;

  PaymentController({
    required this.orderPayUseCase,
  });

  void pay() async {
    (await orderPayUseCase(Params(orderEntity: Get.arguments))).fold(
        // TODO: verificar na APP pq não vem error
        (l) {
      Get.offAll(() => OrderPage(), binding: OrderBiding());
      AppDialog.error(menssagem: l.props.first.toString());
    }, (r) {
      Get.offAll(() => OrderPage(), binding: OrderBiding());
      AppDialog.show(menssagem: 'Pagamento relizado com sucesso');
    });
  }
}
