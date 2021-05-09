import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/credential_entity.dart';
import 'package:t_truck_app/features/domain/repositories/i_login_repository.dart';
import 'package:t_truck_app/features/domain/use_cases/login/login_use_case.dart';

import 'login_use_case_test.mocks.dart';

@GenerateMocks([ILoginRepository])
void main() {
  late LoginUseCase loginUseCase;
  late ILoginRepository mockILoginRepository;
  var params = Params(
      credential: CredentialEntity(login: 'anyLogin', password: 'anyPass'));

  setUp(() {
    mockILoginRepository = MockILoginRepository();
    loginUseCase = LoginUseCase(
      iLoginRepository: mockILoginRepository,
    );
  });

  test('should do login with no erros', () async {
    when(mockILoginRepository.login(params.credential!))
        .thenAnswer((realInvocation) async => Right('123d12d12d'));
    var res = await loginUseCase(params);
    expect(res, isA<Right>());
  });

  test('should do login with erro', () async {
    when(mockILoginRepository.login(params.credential!))
        .thenAnswer((realInvocation) async => Left(AppFailure()));

    var res = await loginUseCase(params);
    expect(res, isA<Left>());
  });
  test('should return ValidationFailure when login is empty', () async {
    var paramsNoLogin = Params(
      credential: CredentialEntity(login: '', password: 'anyPass'),
    );

    when(mockILoginRepository.login(paramsNoLogin.credential!))
        .thenAnswer((realInvocation) async => Left(AppFailure()));

    var res = await loginUseCase(paramsNoLogin);
    expect(res.fold((l) => l, (r) => null), isA<ValidationFailure>());
  });
  test('should return ValidationFailure when password is empty', () async {
    var paramsNoPass = Params(
      credential: CredentialEntity(login: 'anyLogin', password: ''),
    );

    when(mockILoginRepository.login(paramsNoPass.credential!))
        .thenAnswer((realInvocation) async => Left(AppFailure()));

    var res = await loginUseCase(
      paramsNoPass,
    );
    expect(res.fold((l) => l, (r) => null), isA<ValidationFailure>());
  });
}
