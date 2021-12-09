import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawerController extends GetxController {
  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void closeDrawer() {
    Navigator.of(Get.context!).pop();
  }
}
