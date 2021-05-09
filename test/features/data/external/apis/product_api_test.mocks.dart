// Mocks generated by Mockito 5.0.5 from annotations
// in t_truck_app/test/features/data/external/apis/product_api_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart'
    as _i2;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeHttpResponse extends _i1.Fake implements _i2.HttpResponse {}

/// A class which mocks [IHttp].
///
/// See the documentation for Mockito's code generation for more information.
class MockIHttp extends _i1.Mock implements _i2.IHttp {
  MockIHttp() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i2.HttpResponse> getHttp(String? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#getHttp, [url], {#headers: headers}),
              returnValue: Future<_i2.HttpResponse>.value(_FakeHttpResponse()))
          as _i3.Future<_i2.HttpResponse>);
  @override
  _i3.Future<_i2.HttpResponse> putHttp(String? url,
          {Map<String, String>? headers, dynamic body}) =>
      (super.noSuchMethod(
          Invocation.method(#putHttp, [url], {#headers: headers, #body: body}),
          returnValue:
              Future<_i2.HttpResponse>.value(_FakeHttpResponse())) as _i3
          .Future<_i2.HttpResponse>);
  @override
  _i3.Future<_i2.HttpResponse> postHttp(String? url,
          {Map<String, String>? headers, dynamic body}) =>
      (super.noSuchMethod(
          Invocation.method(#postHttp, [url], {#headers: headers, #body: body}),
          returnValue:
              Future<_i2.HttpResponse>.value(_FakeHttpResponse())) as _i3
          .Future<_i2.HttpResponse>);
  @override
  _i3.Future<_i2.HttpResponse> deleteHttp(String? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#deleteHttp, [url], {#headers: headers}),
              returnValue: Future<_i2.HttpResponse>.value(_FakeHttpResponse()))
          as _i3.Future<_i2.HttpResponse>);
}
