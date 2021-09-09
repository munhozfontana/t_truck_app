import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/interceptors/token_interceptor.dart';

class AppInterceptor {
  AppInterceptor();

  List<InterceptorsWrapper> allInterceptor() {
    return [
      TokenInterceptor(
        iLoggedUserl: Get.find(),
      )(),
    ];
  }
}
