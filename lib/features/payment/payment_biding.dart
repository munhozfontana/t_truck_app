import 'package:get/get.dart';
import 'package:t_truck_app/features/payment/data/repository_impl/payment_repository.dart';

import 'domain/repositories/payment_repository.dart';
import 'domain/use_cases/identify_type_payment_case.dart';
import 'domain/use_cases/open_payment_use_case.dart';
import 'ui/page/payment_controller.dart';

class PaymentBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IPaymentRepository>(() => PaymentRepository());
    Get.lazyPut(() => OpenPaymentUseCase(iPaymentRepository: Get.find()));
    Get.lazyPut(() => IdentifyTypePaymentCase());
    Get.put(PaymentController(
      identifyTypePaymentCase: Get.find(),
      openPaymentUseCase: Get.find(),
    ));
  }
}
