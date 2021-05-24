import 'package:flutter_dotenv/flutter_dotenv.dart' as dont_env;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/external/apis/image_api.dart';
import 'package:t_truck_app/features/domain/entites/image_entity.dart';

import 'image_api_test.mocks.dart';

@GenerateMocks([IHttp])
void main() {
  late ImageApi imageApi;
  late IHttp mockIHttp;
  late ImageEntity imageEntity;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await dont_env.load(fileName: '.env');
    mockIHttp = MockIHttp();
    imageApi = ImageApi(iHttp: mockIHttp);
    imageEntity = ImageEntity(
      numcanhoto: '123123',
      canhoto: '123123',
      estabelecimento: '123123',
      data: DateTime.now(),
      codCli: 1,
    );
  });

  test(
    'Should do image with no erros',
    () async {
      when(mockIHttp.postHttp(any, body: anyNamed('body')))
          .thenAnswer((_) async => HttpResponse(body: '', statusCode: 200));
      await imageApi.save(imageEntity);
    },
  );
}
