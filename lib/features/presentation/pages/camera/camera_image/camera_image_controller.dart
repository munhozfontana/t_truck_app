import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/image_entity.dart';
import 'package:t_truck_app/features/domain/use_cases/image/image_save_use_case.dart';
import 'package:t_truck_app/features/presentation/pages/payment/payment_controller.dart';

class CameraImageController extends GetxController {
  final ImageSaveUseCase imageSaveUseCase;

  CameraImageController({
    required this.imageSaveUseCase,
  });

  void saveImage(String image) {
    var orderEntity = Get.find<PaymentController>().orderEntity.value;

    orderEntity.identificacoes;

    imageSaveUseCase(
      Params(
        orderEntity: orderEntity,
        imageEntity: ImageEntity(
            canhoto: image,
            codCli: orderEntity.codCli,
            data: DateTime.now(),
            estabelecimento: '',
            numcanhoto: ''),
      ),
    );
  }
}
