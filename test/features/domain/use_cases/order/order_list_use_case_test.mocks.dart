// Mocks generated by Mockito 5.0.5 from annotations
// in t_truck_app/test/features/domain/use_cases/order/order_list_use_case_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:t_truck_app/core/error/failures.dart' as _i5;
import 'package:t_truck_app/features/domain/entites/order_entity.dart' as _i6;
import 'package:t_truck_app/features/domain/repositories/i_order_repository.dart'
    as _i3;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeEither<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [IOrderRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIOrderRepository extends _i1.Mock implements _i3.IOrderRepository {
  MockIOrderRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.OrderEntity>>> list() => (super
          .noSuchMethod(Invocation.method(#list, []),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i6.OrderEntity>>>.value(
                      _FakeEither<_i5.Failure, List<_i6.OrderEntity>>()))
      as _i4.Future<_i2.Either<_i5.Failure, List<_i6.OrderEntity>>>);
}
