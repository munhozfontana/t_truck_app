import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/credential.dart';
import 'package:t_truck_app/features/domain/repositories/i_login_repository.dart';
import 'package:t_truck_app/features/domain/use_cases/login/login_use_case.dart';

import 'login_use_case_test.mocks.dart';

@GenerateMocks([ILoginRepository])
void main() {
  late LoginUseCase loginUseCase;
  late ILoginRepository mockILoginRepository;
  var params =
      Params(credential: Credential(login: 'anyLogin', pass: 'anyPass'));
  setUp(() {
    mockILoginRepository = MockILoginRepository();
    loginUseCase = LoginUseCase(
      iLoginRepository: mockILoginRepository,
    );
  });

  test('should do login with no erros', () async {
    when(mockILoginRepository.login(params.credential!))
        .thenAnswer((realInvocation) async => Right(true));
    var res = await loginUseCase(params);
    expect(res, isA<Right>());
  });

  test('should do login with erro', () async {
    when(mockILoginRepository.login(params.credential!))
        .thenAnswer((realInvocation) async => Left(AppFailure()));

    var res = await loginUseCase(params);
    expect(res, isA<Left>());
  });
}
