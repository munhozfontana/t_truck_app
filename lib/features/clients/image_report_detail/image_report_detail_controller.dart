import 'dart:io';

import 'package:get/get.dart';
import 'package:t_truck_app/features/clients/image_report/data/models/image_report_model.dart';

class ImageReportDetailController extends GetxController {
  Rx<ImageReportModel>? imageReportModel = Rx(Get.arguments);

  Rx<File>? file;

  @override
  void onInit() {
    super.onInit();
  }

  double? getPercent(Rx<ImageReportModel>? imageReportModel) {
    if (imageReportModel?.value.percent != null) {
      return double.parse(imageReportModel!.value.percent) / 100;
    } else {
      return 0.0;
    }
  }
}
