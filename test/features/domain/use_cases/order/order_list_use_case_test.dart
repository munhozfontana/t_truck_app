import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/repositories/i_order_repository.dart';
import 'package:t_truck_app/features/domain/use_cases/Order/Order_list_use_case.dart';

import 'order_list_use_case_test.mocks.dart';

@GenerateMocks([IOrderRepository])
void main() {
  late OrderListUseCase orderListUseCase;
  late IOrderRepository mockIOrderListRepository;

  setUp(() {
    mockIOrderListRepository = MockIOrderRepository();
    orderListUseCase = OrderListUseCase(
      iOrderListRepository: mockIOrderListRepository,
    );
  });

  test('Should return list orders', () async {
    when(mockIOrderListRepository.list()).thenAnswer(
      (_) async => Right(
        [OrderEntity(nomeMercado: 'any', quantidade: 3)],
      ),
    );
    var res = await orderListUseCase(Params());
    expect(res, isA<Right>());
  });

  test('Should return failure', () async {
    when(mockIOrderListRepository.list()).thenAnswer(
      (_) async => Left(AppFailure()),
    );
    var res = await orderListUseCase(Params());
    expect(res, isA<Left>());
  });
}
