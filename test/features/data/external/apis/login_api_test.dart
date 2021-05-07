import 'package:flutter_dotenv/flutter_dotenv.dart' as dont_env;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/external/apis/login_api.dart';
import 'package:t_truck_app/features/domain/entites/credential_entity.dart';

import 'login_api_test.mocks.dart';

@GenerateMocks([IHttp])
void main() {
  late LoginApi loginApi;
  late IHttp mockIHttp;
  late CredentialEntity credential;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await dont_env.load(fileName: '.env');
    credential = CredentialEntity(login: 'anyLogin', password: 'anyPass');
    mockIHttp = MockIHttp();
    loginApi = LoginApi(iHttp: mockIHttp);
  });

  test(
    'Should do login with no erros',
    () async {
      when(mockIHttp.getHttp(any)).thenAnswer(
          (_) async => HttpResponse(body: '{ "auth": true }', statusCode: 200));
      var res = await loginApi.login(credential);
      expect(res, true);
    },
  );
}
