import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/image_entity.dart';
import 'package:t_truck_app/features/domain/use_cases/image/image_save_use_case.dart';
import 'package:t_truck_app/features/presentation/pages/devolution/devolution_finish/devolution_finish.dart';
import 'package:t_truck_app/features/presentation/pages/payment/payment_controller.dart';
import 'package:t_truck_app/features/presentation/pages/product/product_controller.dart';

class CameraImageController extends GetxController {
  final ImageSaveUseCase imageSaveUseCase;

  CameraImageController({
    required this.imageSaveUseCase,
  });

  void saveImage(String image) async {
    var orderEntity =
        !GetUtils.isNull(Get.find<PaymentController>().orderEntity.value.codCli)
            ? Get.find<ProductController>().orderEntity.value!
            : Get.find<PaymentController>().orderEntity.value;

    orderEntity.identificacoes;

    (await imageSaveUseCase(
      Params(
        orderEntity: orderEntity,
        imageEntity: ImageEntity(
            canhoto: image,
            codCli: orderEntity.codCli,
            data: DateTime.now(),
            estabelecimento: '',
            numcanhoto: ''),
      ),
    ))
        .fold(
      (l) => null,
      (r) {
        Get.to(() => DevolutionFinish());
      },
    );
  }
}
