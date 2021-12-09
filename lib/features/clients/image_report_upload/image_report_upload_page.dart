import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/components/camera_show_component.dart';
import 'package:t_truck_app/features/clients/image_report_upload/image_report_upload_controller.dart';

class ImageReportUploadPage extends GetView<ImageReportUploadController> {
  const ImageReportUploadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    File fileParamter = Get.arguments!;
    return CameraShowComponent(
      fileParamter: fileParamter,
      onFinish: () => controller.updateImage(
        base64Encode(
          fileParamter.readAsBytesSync(),
        ),
      ),
    );
  }
}
