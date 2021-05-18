import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/data/external/adapters/i_jwt_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_local_store_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_order_external.dart';
import 'package:t_truck_app/features/data/repository/order_repository.dart';

import 'order_repository_test.mocks.dart';

@GenerateMocks([IOrderExternal, ILocalStoreExternal, IJwt])
void main() {
  late OrderRepository orderRepository;
  late IOrderExternal mockIOrderExternal;
  late IJwt mockIJwt;
  late ILocalStoreExternal mockILocalStoreExternal;

  setUp(() {
    mockIOrderExternal = MockIOrderExternal();
    mockIJwt = MockIJwt();
    mockILocalStoreExternal = MockILocalStoreExternal();
    orderRepository = OrderRepository(
        iOrderExternal: mockIOrderExternal,
        iJwt: mockIJwt,
        iLocalStoreExternal: mockILocalStoreExternal);
  });

  test('Should return right when no erros', () async {
    when(mockIOrderExternal.list('1')).thenAnswer((_) async => []);
    var res = await orderRepository.list();
    expect(res, isA<Right>());
  });
  test('Should return left when throws ApiException', () async {
    when(mockIOrderExternal.list('1')).thenThrow(ApiException());
    var res = await orderRepository.list();
    expect(res, isA<Left>());
    expect(res.fold((l) => l, (r) => r), isA<RequestFailure>());
  });

  test('Should return left when throws any Exception', () async {
    when(mockIOrderExternal.list('1')).thenThrow(Exception);
    var res = await orderRepository.list();
    expect(res, isA<Left>());
    expect(res.fold((l) => l, (r) => r), isA<AppFailure>());
  });
}
