import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:t_truck_app/core/adapters/protocols/i_logged_user.dart';

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
    return mackObj(await dio.delete(url!, options: Options(headers: headers)));
  }

  @override
  Future<HttpResponse> getHttp(String? url,
      {Map<String, String>? headers}) async {
    return mackObj(await dio.get(url!, options: Options(headers: headers)));
  }

  @override
  Future<HttpResponse> postHttp(String? url,
      {Map<String, String>? headers, body}) async {
    return mackObj(
        await dio.post(url!, data: body, options: Options(headers: headers)));
  }

  @override
  Future<HttpResponse> putHttp(String? url,
      {Map<String, String>? headers, body}) async {
    return mackObj(await dio.put(url!, options: Options(headers: headers)));
  }

  Map<String, String> buildToken() {
    iLoggedUser
    return {'x-access-token': iLoggedUser.t};
  }

  HttpResponse mackObj(Response response) {
    return HttpResponse(
      statusCode: response.statusCode,
      body: jsonEncode(response.data),
      header: response.requestOptions.headers,
    );
  }
}
