import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/use_cases/order/order_pay_use_case.dart';

class PaymentController extends GetxController {
  OrderPayUseCase orderPayUseCase;

  PaymentController({
    required this.orderPayUseCase,
  });

  void pay() {
    orderPayUseCase(Params(orderEntity: Get.arguments));
  }
}
