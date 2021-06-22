import 'package:get/get.dart';
import 'package:t_truck_app/features/clients/finish/ui/page/devolution_finish_controller.dart';

class DevolutionFinishBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<DevolutionFinishController>(DevolutionFinishController(),
        permanent: true);
  }
}
