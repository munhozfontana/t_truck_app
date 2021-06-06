import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/driver_exception.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/repository/order_repository.dart';
import 'package:t_truck_app/features/presentation/pages/login/login_page.dart';
import 'package:t_truck_app/injection_container.dart';

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
    try {
      return mackObj(await dio.delete(url!,
          options: Options(headers: await buildHeader())));
    } on DioError catch (e) {
      await logautWhenUnautorized(e);
      throw ApiException(error: e.response?.data['message'] ?? 'Erro');
    } catch (e) {
      throw DriverException(error: ApiMensages.GENERIC_ERROR);
    }
  }

  @override
  Future<HttpResponse> getHttp(String? url,
      {Map<String, String>? headers}) async {
    try {
      return mackObj(
          await dio.get(url!, options: Options(headers: await buildHeader())));
    } on DioError catch (e) {
      await logautWhenUnautorized(e);
      throw ApiException(error: e.response?.data['message'] ?? 'Erro');
    }
  }

  @override
  Future<HttpResponse> postHttp(String? url,
      {Map<String, String>? headers, body}) async {
    try {
      return mackObj(await dio.post(url!,
          data: body, options: Options(headers: await buildHeader())));
    } on DioError catch (e) {
      await logautWhenUnautorized(e);
      throw ApiException(error: e.response?.data['message'] ?? 'Erro');
    } catch (e) {
      throw DriverException(error: ApiMensages.GENERIC_ERROR);
    }
  }

  @override
  Future<HttpResponse> putHttp(String? url,
      {Map<String, String>? headers, body}) async {
    try {
      return mackObj(
          await dio.put(url!, options: Options(headers: await buildHeader())));
    } on DioError catch (e) {
      await logautWhenUnautorized(e);
      throw ApiException(error: e.response?.data['message'] ?? 'Erro');
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

  Future<Map<String, String>> buildHeader() async {
    String token;
    try {
      token = await iLoggedUser.token;
    } catch (e) {
      return {};
    }
    var headers = {'x-access-token': token};
    return headers;
  }

  Future<void> logautWhenUnautorized(DioError e) async {
    if (e.response != null && e.response!.statusCode == 401) {
      await Get.offAll(LoginPage(), binding: LoginBiding());
    }
  }
}
