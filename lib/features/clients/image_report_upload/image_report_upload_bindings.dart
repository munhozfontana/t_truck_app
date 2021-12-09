import 'package:get/get.dart';

import './image_report_upload_controller.dart';

class ImageReportUploadBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ImageReportUploadController(imageReportUpdateUseCase: Get.find()));
  }
}
