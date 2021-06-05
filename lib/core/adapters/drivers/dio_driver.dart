import 'dart:convert';

import 'package:dio/dio.dart';

import '../../error/driver_exception.dart';
import '../../messages/api_mensages.dart';
import '../protocols/i_http_external.dart';

class DioDriver implements IHttp {
  final Dio dio;

  DioDriver({
    required this.dio,
  });

  @override
  Future<HttpResponse> deleteHttp(String? url,
      {Map<String, String>? headers}) async {
    try {
      return mackObj(
          await dio.delete(url!, options: Options(headers: headers)));
    } on Exception catch (e) {
      throw DriverException(error: ApiMensages.GENERIC_ERROR);
    }
  }

  @override
  Future<HttpResponse> getHttp(String? url,
      {Map<String, String>? headers}) async {
    try {
      return mackObj(await dio.get(url!, options: Options(headers: headers)));
    } catch (e) {
      throw DriverException(error: ApiMensages.GENERIC_ERROR);
    }
  }

  @override
  Future<HttpResponse> postHttp(String? url,
      {Map<String, String>? headers, body}) async {
    try {
      return mackObj(
          await dio.post(url!, data: body, options: Options(headers: headers)));
    } catch (e) {
      throw DriverException(error: ApiMensages.GENERIC_ERROR);
    }
  }

  @override
  Future<HttpResponse> putHttp(String? url,
      {Map<String, String>? headers, body}) async {
    try {
      return mackObj(await dio.put(url!, options: Options(headers: headers)));
    } catch (e) {
      throw DriverException(error: ApiMensages.GENERIC_ERROR);
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
