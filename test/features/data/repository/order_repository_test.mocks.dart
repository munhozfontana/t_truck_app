// Mocks generated by Mockito 5.0.5 from annotations
// in t_truck_app/test/features/data/repository/order_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:t_truck_app/features/data/external/adapters/i_jwt_external.dart'
    as _i6;
import 'package:t_truck_app/features/data/external/adapters/i_local_store_external.dart'
    as _i5;
import 'package:t_truck_app/features/data/external/adapters/i_order_external.dart'
    as _i2;
import 'package:t_truck_app/features/domain/entites/order_entity.dart' as _i4;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [IOrderExternal].
///
/// See the documentation for Mockito's code generation for more information.
class MockIOrderExternal extends _i1.Mock implements _i2.IOrderExternal {
  MockIOrderExternal() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.OrderEntity>> list(String? codMotorista) =>
      (super.noSuchMethod(Invocation.method(#list, [codMotorista]),
              returnValue:
                  Future<List<_i4.OrderEntity>>.value(<_i4.OrderEntity>[]))
          as _i3.Future<List<_i4.OrderEntity>>);
}

/// A class which mocks [ILocalStoreExternal].
///
/// See the documentation for Mockito's code generation for more information.
class MockILocalStoreExternal extends _i1.Mock
    implements _i5.ILocalStoreExternal {
  MockILocalStoreExternal() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<Object?>? take(String? key) =>
      (super.noSuchMethod(Invocation.method(#take, [key]))
          as _i3.Future<Object?>?);
  @override
  _i3.Future<void> save(String? key, dynamic value) =>
      (super.noSuchMethod(Invocation.method(#save, [key, value]),
          returnValue: Future<void>.value(null),
          returnValueForMissingStub: Future.value()) as _i3.Future<void>);
}

/// A class which mocks [IJwt].
///
/// See the documentation for Mockito's code generation for more information.
class MockIJwt extends _i1.Mock implements _i6.IJwt {
  MockIJwt() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Map<dynamic, dynamic> jwtDecode(String? token) =>
      (super.noSuchMethod(Invocation.method(#jwtDecode, [token]),
          returnValue: <dynamic, dynamic>{}) as Map<dynamic, dynamic>);
  @override
  bool isExpired(String? token) =>
      (super.noSuchMethod(Invocation.method(#isExpired, [token]),
          returnValue: false) as bool);
}