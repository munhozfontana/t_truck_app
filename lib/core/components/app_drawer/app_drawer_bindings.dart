import 'package:get/get.dart';
import './app_drawer_controller.dart';

class AppDrawerBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(AppDrawerController());
    }
}