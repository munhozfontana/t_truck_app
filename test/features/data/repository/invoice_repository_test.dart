import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/data/external/adapters/i_invoice_external.dart';
import 'package:t_truck_app/features/data/repository/invoice_repository.dart';

import 'invoice_repository_test.mocks.dart';

@GenerateMocks([IInvoiceExternal])
void main() {
  late InvoiceRepository invoiceRepository;
  late IInvoiceExternal mockIInvoiceExternal;

  setUp(() {
    mockIInvoiceExternal = MockIInvoiceExternal();
    invoiceRepository =
        InvoiceRepository(iInvoiceExternal: mockIInvoiceExternal);
  });

  test('Should return right when no erros', () async {
    when(mockIInvoiceExternal.list()).thenAnswer((_) async => []);
    var res = await invoiceRepository.list();
    expect(res, isA<Right>());
  });
  test('Should return left when throws ApiException', () async {
    when(mockIInvoiceExternal.list()).thenThrow(ApiException());
    var res = await invoiceRepository.list();
    expect(res, isA<Left>());
    expect(res.fold((l) => l, (r) => r), isA<RequestFailure>());
  });

  test('Should return left when throws any Exception', () async {
    when(mockIInvoiceExternal.list()).thenThrow(Exception);
    var res = await invoiceRepository.list();
    expect(res, isA<Left>());
    expect(res.fold((l) => l, (r) => r), isA<AppFailure>());
  });
}
