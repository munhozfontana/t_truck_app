import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/params/params.dart';
import '../../../../core/use_case.dart';
import '../repositores/i_token_repository.dart';

class TokenUseCase implements UseCase<Type, Params> {
  final ITokenRepository tokenRepository;

  TokenUseCase({required this.tokenRepository});

  @override
  Either<Failure, Map> call(Params params) {
    if (params.token == null) {
      return Left(ValidationFailure(detail: 'Token não pode ser null'));
    }

    return tokenRepository.jwtDecode(params.token!).fold(
          (l) => Left(AppFailure()),
          (r) => Right(r),
        );
  }
}
