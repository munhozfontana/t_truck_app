import 'package:get/get.dart';

import './image_report_detail_controller.dart';

class ImageReportDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ImageReportDetailController());
  }
}
