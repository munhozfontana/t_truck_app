import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:t_truck_app/features/clients/camera/show_picture/domain/repositories/image_repository.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../../../core/params/params.dart';
import '../../../../../../core/use_case.dart';

class ImageSaveUseCase implements UseCaseAsync<Type, Params> {
  final IImageRepository iImageRepository;

  ImageSaveUseCase({
    required this.iImageRepository,
  });

  @override
  Future<Either<Failure, void>> call(Params params) async {
    if (GetUtils.isNull(params.imageModel)) {
      return Left(ValidationFailure(detail: 'Image não pode estar vazia'));
    }

    if (GetUtils.isNull(params.clientModel)) {
      return Left(ValidationFailure(detail: 'Order não pode estar vazia'));
    }

    var dataSaida = DateFormat('yy/MM/dd')
        .format(
            DateTime.parse(params.clientModel!.paymentTypeGsa!.first.dtSaida!))
        .toString()
        .replaceAll('/', '');

    var numcanhotoConcatenado = dataSaida +
        params.clientModel!.codCli.toString() +
        params.clientModel!.paymentTypeGsa!.first.numCar.toString();

    var imageEntity = params.imageModel!.copyWith(
      numcanhoto: numcanhotoConcatenado,
    );

    return await iImageRepository.save(imageEntity);
  }
}
