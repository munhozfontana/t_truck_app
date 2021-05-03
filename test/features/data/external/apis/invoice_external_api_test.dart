import 'package:flutter_dotenv/flutter_dotenv.dart' as dont_env;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/external/apis/invoice_external_api.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'invoice_external_api_test.mocks.dart';

@GenerateMocks([IHttp])
void main() {
  late InvoiceExternalApi invoiceExternalApi;
  late IHttp mockIHttp;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await dont_env.load(fileName: '.env');
    mockIHttp = MockIHttp();
    invoiceExternalApi = InvoiceExternalApi(iHttp: mockIHttp);
  });

  test('Should return value with no erros', () async {
    when(
      mockIHttp.getHttp(any),
    ).thenAnswer(
      (_) async => HttpResponse(
        body: fixture('invoice.json'),
        statusCode: 200,
      ),
    );
    var res = await invoiceExternalApi.list();
    expect(res.length, equals(54));
  });
  test('Should throw [ApiException] when throw any error', () {
    when(
      mockIHttp.getHttp(any),
    ).thenThrow(Exception);
    expect(invoiceExternalApi.list(), throwsA(isA<ApiException>()));
  });
}
