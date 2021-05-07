// Mocks generated by Mockito 5.0.5 from annotations
// in t_truck_app/test/features/data/repository/login_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:t_truck_app/features/data/external/adapters/i_login_external.dart'
    as _i2;
import 'package:t_truck_app/features/domain/entites/credential_entity.dart'
    as _i4;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [ILogin].
///
/// See the documentation for Mockito's code generation for more information.
class MockILogin extends _i1.Mock implements _i2.ILogin {
  MockILogin() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> login(_i4.CredentialEntity? credential) =>
      (super.noSuchMethod(Invocation.method(#login, [credential]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
}
