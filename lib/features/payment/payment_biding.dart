import 'package:get/get.dart';
import 'package:t_truck_app/features/payment/domain/use_cases/identify_type_payment_case.dart';
import 'package:t_truck_app/features/payment/ui/page/payment_controller.dart';

class PaymentBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IdentifyTypePaymentCase());
    Get.put(PaymentController(identifyTypePaymentCase: Get.find()));
  }
}
