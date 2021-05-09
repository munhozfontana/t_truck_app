import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/data/external/adapters/i_login_external.dart';
import 'package:t_truck_app/features/data/models/credential_model.dart';
import 'package:t_truck_app/features/data/repository/login_repository.dart';

import 'login_repository_test.mocks.dart';

@GenerateMocks([ILogin])
void main() {
  late LoginRepository loginRepository;
  late ILogin mockILogin;
  late CredentialModel credentials;

  setUp(() {
    credentials = CredentialModel(login: 'AnyLogin', password: 'AnyPass');
    mockILogin = MockILogin();
    loginRepository = LoginRepository(iLoginApi: mockILogin);
  });

  test('Should return right when no erros', () async {
    when(mockILogin.login(credentials)).thenAnswer((_) async => 'd21d1d4fsdf');
    var res = await loginRepository.login(credentials);
    expect(res, isA<Right>());
  });
  test('Should return left when throws ApiException', () async {
    when(mockILogin.login(credentials)).thenThrow(ApiException());
    var res = await loginRepository.login(credentials);
    expect(res, isA<Left>());
    expect(res.fold((l) => l, (r) => r), isA<RequestFailure>());
  });

  test('Should return left when throws any Exception', () async {
    when(mockILogin.login(credentials)).thenThrow(Exception);
    var res = await loginRepository.login(credentials);
    expect(res, isA<Left>());
    expect(res.fold((l) => l, (r) => r), isA<AppFailure>());
  });
}
