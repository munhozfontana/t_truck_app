import 'package:http/http.dart' as http;
import 'package:t_truck_app/core/error/driver_exception.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';

class HttpDriver implements IHttp {
  final http.Client? client;

  HttpDriver({required this.client});

  @override
  Future<HttpResponse> deleteHttp(String? url,
      {Map<String, String>? headers}) async {
    try {
      return mackObj(await client!.delete(Uri.parse(url!), headers: headers));
    } catch (e) {
      throw DriverException(error: ApiMensages.GENERIC_ERROR);
    }
  }

  @override
  Future<HttpResponse> getHttp(String? url,
      {Map<String, String>? headers}) async {
    try {
      return mackObj(await client!.get(Uri.parse(url!), headers: headers));
    } catch (e) {
      throw DriverException(error: ApiMensages.GENERIC_ERROR);
    }
  }

  @override
  Future<HttpResponse> postHttp(
    String? url, {
    Map<String, String>? headers = const {'Content-Type': 'application/json'},
    body,
  }) async {
    try {
      return mackObj(
        await client!.post(Uri.parse(url!), headers: headers, body: body),
      );
    } catch (e) {
      throw DriverException(error: ApiMensages.GENERIC_ERROR);
    }
  }

  @override
  Future<HttpResponse> putHttp(
    String? url, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    try {
      return mackObj(
          await client!.put(Uri.parse(url!), headers: headers, body: body));
    } catch (e) {
      throw DriverException(error: ApiMensages.GENERIC_ERROR);
    }
  }

  HttpResponse mackObj(http.Response response) {
    return HttpResponse(
      statusCode: response.statusCode,
      body: response.body,
      header: response.headers,
    );
  }
}
