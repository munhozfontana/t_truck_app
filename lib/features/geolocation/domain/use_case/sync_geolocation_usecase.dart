import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/core/use_case.dart';
import 'package:t_truck_app/features/geolocation/domain/repositories/i_geolocation_repository.dart';

class SyncGeolocationUseCase implements UseCaseAsync<Type, Params> {
  final IGeolocationRepository geolocationRepository;

  SyncGeolocationUseCase({required this.geolocationRepository});

  @override
  Future<Either<Failure, void>> call(Params params) async {
    var resAutorization = await geolocationRepository.getAutorization();
    return resAutorization.fold(
      (l) => Left(AppFailure()),
      (r) {
        if (r) {
          return Right(initSyncGeolocation());
        } else {
          return Left(AppFailure());
        }
      },
    );
  }

  @Deprecated(
      'Maneira Incorreta de pegar a localizacao, deve ser por meio de servicos background')
  Future<Right<Failure, Timer>> initSyncGeolocation() async {
    return Right(Timer.periodic(
      Duration(minutes: 1),
      (timer) async => (await geolocationRepository.getGeolocation()).fold(
        (l) => Left(AppFailure()),
        (r) => geolocationRepository.saveGeolocation(r),
      ),
    ));
  }
}
