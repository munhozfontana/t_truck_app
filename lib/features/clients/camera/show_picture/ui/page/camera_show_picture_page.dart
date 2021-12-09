import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/components/camera_show_component.dart';

import 'camera_show_picture_controller.dart';

class ShowPicture extends GetWidget<CameraImageController> {
  const ShowPicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    File fileParamter = Get.arguments!;
    return CameraShowComponent(
      fileParamter: fileParamter,
      onFinish: () => controller.saveImage(
        base64Encode(
          fileParamter.readAsBytesSync(),
        ),
      ),
    );
  }
}
