import 'package:flutter_dotenv/flutter_dotenv.dart' as dont_env;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/external/apis/devolution_api.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'login_api_test.mocks.dart';

void main() {
  late DevolutionApi devolutionApi;
  late IHttp mockIHttp;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await dont_env.load(fileName: '.env');
    mockIHttp = MockIHttp();
    devolutionApi = DevolutionApi(iHttp: mockIHttp);
  });

  test(
    'Should do devolution with no erros',
    () async {
      when(mockIHttp.getHttp(any)).thenAnswer((_) async =>
          HttpResponse(body: fixture('devolution.json'), statusCode: 200));
      var res = await devolutionApi.list();
      expect(res.length, 19);
    },
  );
}
