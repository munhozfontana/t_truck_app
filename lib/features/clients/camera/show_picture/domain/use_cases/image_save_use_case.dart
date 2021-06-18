import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:t_truck_app/features/clients/camera/show_picture/domain/repositories/image_repository.dart';
import 'package:t_truck_app/features/payment/ui/page/payment_controller.dart';

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
    var clientModel = params.clientModel;
    var imageModel = params.imageModel;

    if (GetUtils.isNull(imageModel)) {
      return Left(ValidationFailure(detail: 'Image não pode estar vazia'));
    }

    if (GetUtils.isNull(clientModel)) {
      return Left(ValidationFailure(detail: 'Order não pode estar vazia'));
    }

    if (params.fromPayment == FromPayment.CREDIT_CARD) {
      clientModel = clientModel!.copyWith(
          paymentTypeGsa: params.clientModel!.paymentTypeGsa!
              .where((element) => element.valorCartao! > 0)
              .toList());
    }

    var dataSaida = DateFormat('yy/MM/dd')
        .format(DateTime.parse(clientModel!.paymentTypeGsa!.first.dtSaida!))
        .toString()
        .replaceAll('/', '');

    var numcanhotoConcatenado = dataSaida +
        clientModel.codCli.toString() +
        clientModel.paymentTypeGsa!.first.numCar.toString();

    var imageEntity = imageModel!.copyWith(
      numcanhoto: numcanhotoConcatenado,
      codCli: imageModel.codCli,
      data: DateTime.now().toIso8601String(),
    );

    return await iImageRepository.save(imageEntity);
  }
}
