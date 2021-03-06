// Mocks generated by Mockito 5.0.5 from annotations
// in t_truck_app/test/features/domain/use_cases/login/login_use_case_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:t_truck_app/core/error/failures.dart' as _i5;
import 'package:t_truck_app/features/domain/entites/credential_entity.dart'
    as _i6;
import 'package:t_truck_app/features/domain/repositories/i_login_repository.dart'
    as _i3;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeEither<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [ILoginRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockILoginRepository extends _i1.Mock implements _i3.ILoginRepository {
  MockILoginRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> login(
          _i6.CredentialEntity? credentials) =>
      (super.noSuchMethod(Invocation.method(#login, [credentials]),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither<_i5.Failure, String>()))
          as _i4.Future<_i2.Either<_i5.Failure, String>>);
}
