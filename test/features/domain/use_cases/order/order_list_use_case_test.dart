import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/orders.dart';
import 'package:t_truck_app/features/domain/repositories/i_order_list_repository.dart';
import 'package:t_truck_app/features/domain/use_cases/order/order_list_use_case.dart';

import 'order_list_use_case_test.mocks.dart';

@GenerateMocks([IOrderListRepository])
void main() {
  late OrderListUseCase orderListUseCase;
  late IOrderListRepository mockIOrderListRepository;

  setUp(() {
    mockIOrderListRepository = MockIOrderListRepository();
    orderListUseCase =
        OrderListUseCase(iOrderListRepository: mockIOrderListRepository);
  });

  test('Should return list orders', () {
    when(mockIOrderListRepository.orderlist()).thenAnswer(
      (_) async => Right(
        [Orders(name: 'any')],
      ),
    );
    orderListUseCase(Params());
  });
}
