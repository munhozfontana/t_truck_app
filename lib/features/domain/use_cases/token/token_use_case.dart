import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/core/use_case.dart';
import 'package:t_truck_app/features/domain/repositories/i_token_repository.dart';

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
