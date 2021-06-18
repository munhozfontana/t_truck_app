import 'package:get/get.dart';
import 'package:t_truck_app/features/clients/camera/show_picture/data/external/image_api.dart';
import 'package:t_truck_app/features/clients/camera/show_picture/data/repositories_impl/image_repository.dart';
import 'package:t_truck_app/features/clients/camera/show_picture/domain/repositories/image_repository.dart';
import 'package:t_truck_app/features/clients/camera/show_picture/domain/use_cases/image_save_use_case.dart';
import 'package:t_truck_app/features/clients/camera/show_picture/ui/page/camera_show_picture_controller.dart';

class ShowPictureBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IImageExternal>(
      () => ImageExternal(
        iHttp: Get.find(),
      ),
    );
    Get.lazyPut<IImageRepository>(
      () => ImageRepository(
        iImageExternal: Get.find(),
      ),
    );
    Get.lazyPut(
      () => ImageSaveUseCase(
        iImageRepository: Get.find(),
      ),
    );
    Get.put(
      CameraImageController(
        imageSaveUseCase: Get.find(),
      ),
    );
  }
}
