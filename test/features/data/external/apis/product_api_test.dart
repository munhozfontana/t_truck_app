import 'package:flutter_dotenv/flutter_dotenv.dart' as dont_env;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/external/apis/product_api.dart';
import 'package:t_truck_app/features/domain/entites/transacao_venda_entity.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'login_api_test.mocks.dart';

@GenerateMocks([IHttp])
void main() {
  late ProductApi productExternalApi;
  late IHttp mockIHttp;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await dont_env.load(fileName: '.env');
    mockIHttp = MockIHttp();
    productExternalApi = ProductApi(iHttp: mockIHttp);
  });

  test(
    'Should do product with no erros',
    () async {
      when(mockIHttp.postHttp(any, body: anyNamed('body'))).thenAnswer(
          (_) async =>
              HttpResponse(body: fixture('product.json'), statusCode: 200));
      var res = await productExternalApi.list([
        TransacaoVendaEntity(
          numTransVenda: 32370156,
          numNota: 32370158,
          valor: 300,
        )
      ]);
      expect(res.length, 19);
    },
  );
}
