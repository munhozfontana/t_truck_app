import 'package:flutter_dotenv/flutter_dotenv.dart' as dont_env;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/external/apis/order_external_api.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'order_external_api_test.mocks.dart';

@GenerateMocks([IHttp])
void main() {
  late OrderExternalApi orderExternalApi;
  late IHttp mockIHttp;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await dont_env.load(fileName: '.env');
    mockIHttp = MockIHttp();
    orderExternalApi = OrderExternalApi(iHttp: mockIHttp);
  });

  test(
    'Should do order with no erros',
    () async {
      when(mockIHttp.getHttp(any)).thenAnswer((_) async =>
          HttpResponse(body: fixture('order.json'), statusCode: 200));
      var res = await orderExternalApi.list();
      expect(res.length, 50);
    },
  );
}
