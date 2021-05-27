import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../../../core/params/params.dart';
import '../../../../../../core/use_case.dart';

class ImageSaveUseCase implements UseCaseAsync<Type, Params> {
  @override
  Future<Either<Failure, void>> call(Params params) async {
    // if (GetUtils.isNull(params.imageEntity)) {
    //   return Left(ValidationFailure(detail: 'Image não pode estar vazia'));
    // }

    // if (GetUtils.isNull(params.orderEntity)) {
    //   return Left(ValidationFailure(detail: 'Order não pode estar vazia'));
    // }

    // var dataSaida = DateFormat('yy/MM/d')
    //     .format(DateTime.parse(params.orderEntity!.dtSaida))
    //     .toString()
    //     .replaceAll('/', '');

    // var numcanhotoConcatenado = dataSaida +
    //     params.orderEntity!.codCli.toString() +
    //     params.orderEntity!.numCar.toString();

    // var imageEntity = params.imageEntity!.copyWith(
    //   numcanhoto: numcanhotoConcatenado,
    // );

    return Right(2);
  }
}
