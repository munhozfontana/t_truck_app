import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_app/core/error/driver_exception.dart';
import 'package:t_truck_app/features/data/external/drivers/http_driver.dart';

import 'http_driver_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late HttpDriver httpAdapterImpl;
  http.Client? client;
  http.Response? anyResponse;
  //PARAMS
  late String anyUrl;
  String? anyBody;
  int anyStatusCode;
  Map<String, String>? anyHeader;

  setUp(() {
    client = MockClient();
    httpAdapterImpl = HttpDriver(client: client);
    anyBody = {'any_param': 'anyValue'}.toString();
    anyStatusCode = 200;
    anyUrl = 'ANY_URL';
    anyHeader = <String, String>{'ANY_KEY': 'ANY_VALUE'};
    anyResponse = http.Response(
      anyBody!,
      anyStatusCode,
    );
  });

  // mocks
  void mockGet() {
    when(client!.get(Uri.parse(anyUrl), headers: anyHeader)).thenAnswer(
      ((_) async => anyResponse!),
    );
  }

  void mockPut() {
    when(client!.put(Uri.parse(anyUrl), headers: anyHeader)).thenAnswer(
      ((_) async => anyResponse!),
    );
  }

  void mockPost() {
    when(client!.post(Uri.parse(anyUrl), headers: anyHeader)).thenAnswer(
      ((_) async => anyResponse!),
    );
  }

  void mockDelete() {
    when(client!.delete(Uri.parse(anyUrl), headers: anyHeader)).thenAnswer(
      ((_) async => anyResponse!),
    );
  }

  group('success', () {
    test('get', () async {
      mockGet();
      var res = await httpAdapterImpl.getHttp(anyUrl, headers: anyHeader);
      expect(res.body, anyBody);
    });
    test('put', () async {
      mockPut();
      var res = await httpAdapterImpl.putHttp(anyUrl, headers: anyHeader);
      expect(res.body, anyBody);
    });
    test('post', () async {
      mockPost();
      var res = await httpAdapterImpl.postHttp(anyUrl, headers: anyHeader);
      expect(res.body, anyBody);
    });
    test('delete', () async {
      mockDelete();
      var res = await httpAdapterImpl.deleteHttp(anyUrl, headers: anyHeader);
      expect(res.body, anyBody);
    });
  });

  group('error', () {
    test('get', () {
      expect(
        httpAdapterImpl.getHttp(anyUrl, headers: anyHeader),
        throwsA(isA<DriverException>()),
      );
    });
    test('put', () {
      expect(
        httpAdapterImpl.putHttp(anyUrl, headers: anyHeader),
        throwsA(isA<DriverException>()),
      );
    });
    test('post', () {
      expect(
        httpAdapterImpl.postHttp(anyUrl, headers: anyHeader),
        throwsA(isA<DriverException>()),
      );
    });
    test('delete', () {
      expect(
        httpAdapterImpl.deleteHttp(anyUrl, headers: anyHeader),
        throwsA(isA<DriverException>()),
      );
    });
  });
}
