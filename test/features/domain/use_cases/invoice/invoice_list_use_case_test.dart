import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/invoice.dart';
import 'package:t_truck_app/features/domain/repositories/i_invoice_repository.dart';
import 'package:t_truck_app/features/domain/use_cases/invoice/invoice_list_use_case.dart';

import 'invoice_list_use_case_test.mocks.dart';

@GenerateMocks([IInvoiceRepository])
void main() {
  late InvoiceListUseCase orderListUseCase;
  late IInvoiceRepository mockIOrderListRepository;

  setUp(() {
    mockIOrderListRepository = MockIInvoiceRepository();
    orderListUseCase = InvoiceListUseCase(
      iInvoiceListRepository: mockIOrderListRepository,
    );
  });

  test('Should return list orders', () async {
    when(mockIOrderListRepository.list()).thenAnswer(
      (_) async => Right(
        [Invoice(nomeMercado: 'any', quantidade: 3)],
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
