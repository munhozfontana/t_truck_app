import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/params/params.dart';
import '../../../../core/use_case.dart';
import '../../repositories/i_image_repository.dart';

class ImageSaveUseCase implements UseCaseAsync<Type, Params> {
  IImageRepository iImageListRepository;

  ImageSaveUseCase({
    required this.iImageListRepository,
  });

  @override
  Future<Either<Failure, void>> call(Params params) async {
    if (GetUtils.isNull(params.imageEntity)) {
      return Left(ValidationFailure(detail: 'Image não pode estar vazia'));
    }

    return Right(await iImageListRepository.save(params.imageEntity!));
  }
}
