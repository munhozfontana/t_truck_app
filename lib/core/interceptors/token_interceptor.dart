import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/adapters/protocols/i_logged_user.dart';
import 'package:t_truck_app/core/interceptors/protocol_interceptor.dart';

class TokenInterceptor implements IProtocolInterceptor {
  final ILoggedUser iLoggedUserl;

  TokenInterceptor({required this.iLoggedUserl});

  @override
  InterceptorsWrapper call() {
    return InterceptorsWrapper(onRequest: (options, handler) async {
      if (Get.currentRoute == '/') {
        return handler.next(options);
      }
      if (Get.currentRoute.contains('LoginPage')) {
        return handler.next(options);
      }
      try {
        final token = await iLoggedUserl.token;
        if (token.isBlank ?? false || await iLoggedUserl.loginExpired()) {
          await Get.toNamed('/');
        }
        options.headers.addAll({'x-access-token': token});
      } catch (e) {
        await Get.toNamed('/');
        log('Sem token de acesso');
      }

      return handler.next(options);
    });
  }
}
