import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_app/core/error/driver_exception.dart';
import 'package:t_truck_app/features/data/external/drivers/dio_driver.dart';

import 'dio_driver_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late DioDriver dioDriver;
  late Dio dio;
  late Response anyResponse;
  //PARAMS
  late String anyUrl;
  late String anyBody;
  late int anyStatusCode;
  late Map<String, String> anyHeader;

  setUp(() {
    dio = MockDio();
    dioDriver = DioDriver(dio: dio);
    anyBody =
        '{ "id": "41", "nomeMercado": "nomeMercado 41", "quantidade": 10 }';
    anyStatusCode = 200;
    anyUrl = 'ANY_URL';
    anyHeader = <String, String>{'ANY_KEY': 'ANY_VALUE'};
    anyResponse = Response(
        data: anyBody,
        statusCode: anyStatusCode,
        requestOptions: RequestOptions(path: 'any', headers: anyHeader));
  });

  void mockGet() {
    when(dio.get(anyUrl, options: anyNamed('options'))).thenAnswer(
      ((_) async => anyResponse),
    );
  }

  void mockPut() {
    when(dio.put(anyUrl, options: anyNamed('options'))).thenAnswer(
      ((_) async => anyResponse),
    );
  }

  void mockPost() {
    when(dio.post(anyUrl, options: anyNamed('options'))).thenAnswer(
      ((_) async => anyResponse),
    );
  }

  void mockDelete() {
    when(dio.delete(anyUrl, options: anyNamed('options'))).thenAnswer(
      ((_) async => anyResponse),
    );
  }

  group('success', () {
    test('get', () async {
      mockGet();
      var res = await dioDriver.getHttp(anyUrl, headers: anyHeader);
      expect(res.body, jsonEncode(anyBody));
    });
    test('put', () async {
      mockPut();
      var res = await dioDriver.putHttp(anyUrl, headers: anyHeader);
      expect(res.body, jsonEncode(anyBody));
    });
    test('post', () async {
      mockPost();
      var res = await dioDriver.postHttp(anyUrl, headers: anyHeader);
      expect(res.body, jsonEncode(anyBody));
    });
    test('delete', () async {
      mockDelete();
      var res = await dioDriver.deleteHttp(anyUrl, headers: anyHeader);
      expect(res.body, jsonEncode(anyBody));
    });
  });

  group('error', () {
    test('get', () {
      expect(
        dioDriver.getHttp(anyUrl, headers: anyHeader),
        throwsA(isA<DriverException>()),
      );
    });
    test('put', () {
      expect(
        dioDriver.putHttp(anyUrl, headers: anyHeader),
        throwsA(isA<DriverException>()),
      );
    });
    test('post', () {
      expect(
        dioDriver.postHttp(anyUrl, headers: anyHeader),
        throwsA(isA<DriverException>()),
      );
    });
    test('delete', () {
      expect(
        dioDriver.deleteHttp(anyUrl, headers: anyHeader),
        throwsA(isA<DriverException>()),
      );
    });
  });
}
