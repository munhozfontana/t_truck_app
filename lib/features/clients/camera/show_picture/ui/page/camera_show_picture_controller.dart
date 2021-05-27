import 'package:get/get.dart';

import '../../domain/use_cases/image_save_use_case.dart';

class CameraImageController extends GetxController {
  final ImageSaveUseCase imageSaveUseCase;

  CameraImageController({
    required this.imageSaveUseCase,
  });

  void saveImage(String image) async {}
}
