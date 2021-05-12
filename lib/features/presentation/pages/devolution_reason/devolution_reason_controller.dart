import 'package:get/get.dart';
import 'package:t_truck_app/features/presentation/components/btn_devolution.dart';
import 'package:t_truck_app/features/presentation/pages/delivery/delivery_controller.dart';
import 'package:t_truck_app/features/presentation/pages/devolution/devolution_page.dart';
import 'package:t_truck_app/features/presentation/pages/devolution_finish/devolution_finish.dart';
import 'package:t_truck_app/features/presentation/pages/payment/payment_page.dart';
import 'package:t_truck_app/features/presentation/utils/base_controller.dart';

class DevolutionReasonController extends GetxController with BaseController {
  void back() {
    Get.off(() => DevolutionPage());
  }

  void finishReson() {
    var deliveryController = Get.find<DeliveryController>();
    if (deliveryController.devolutionState == TypeDevolution.YELLOW) {
      Get.to(() => PaymentPage());
    } else {
      Get.to(() => DevolutionFinish());
    }
  }
}
