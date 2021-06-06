import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:t_truck_app/core/adapters/protocols/i_logged_user.dart';
import 'package:t_truck_app/features/login/login_biding.dart';
import 'package:t_truck_app/features/login/ui/page/login_page.dart';

import '../protocols/i_http_external.dart';

class DioDriver implements IHttp {
  final Dio dio;
  final ILoggedUser iLoggedUser;

  DioDriver({
    required this.dio,
    required this.iLoggedUser,
  });

  @override
  Future<HttpResponse> deleteHttp(String? url,
      {Map<String, String>? headers}) async {
    return mackObj(
        await dio.delete(url!, options: await buildOptions(headers)));
  }

  @override
  Future<HttpResponse> getHttp(String? url,
      {Map<String, String>? headers}) async {
    return mackObj(await dio.get(url!, options: await buildOptions(headers)));
  }

  @override
  Future<HttpResponse> postHttp(String? url,
      {Map<String, String>? headers, body}) async {
    return mackObj(
        await dio.post(url!, data: body, options: await buildOptions(headers)));
  }

  @override
  Future<HttpResponse> putHttp(String? url,
      {Map<String, String>? headers, body}) async {
    return mackObj(await dio.put(url!, options: await buildOptions(headers)));
  }

  Future<Options> buildOptions(Map<String, String>? headersParam) async {
    String token;

    try {
      token = await iLoggedUser.token;
    } catch (e) {
      token = '';
    }

    var headers = {'x-access-token': token};

    if (headersParam != null) {
      headers.addAll(headersParam);
    }

    return Options(headers: headers);
  }

  Future<void> logautWhenUnautorized(DioError e) async {
    if (e.response != null && e.response!.statusCode == 401) {
      await Get.offAll(LoginPage(), binding: LoginBiding());
    }
  }

  HttpResponse mackObj(Response response) {
    return HttpResponse(
      statusCode: response.statusCode,
      body: jsonEncode(response.data),
      header: response.requestOptions.headers,
    );
  }
}
