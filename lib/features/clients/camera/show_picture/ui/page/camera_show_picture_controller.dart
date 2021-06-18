import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/clients/camera/show_picture/data/models/image_model.dart';
import 'package:t_truck_app/features/clients/list_clients/data/models/client_model.dart';
import 'package:t_truck_app/features/payment/ui/page/payment_controller.dart';

import '../../domain/use_cases/image_save_use_case.dart';

class CameraImageController extends GetxController {
  final ImageSaveUseCase imageSaveUseCase;

  Rx<FromPayment> fromPayment = FromPayment.NONE.obs;
  Rx<ClientModel> clientModel = ClientModel().obs;

  CameraImageController({
    required this.imageSaveUseCase,
  });

  @override
  void onInit() {
    var paymentController = Get.find<PaymentController>();
    clientModel = paymentController.clientModel;

    super.onInit();
  }

  void saveImage(String image) async {
    (await imageSaveUseCase(Params(
      imageModel: ImageModel(
        imgCanhotoBase64: image,
        imgEstabelecimentoBase64: '',
      ),
      clientModel: clientModel.value,
      fromPayment: fromPayment.value,
    )))
        .fold(
      (l) => null,
      (r) => null,
    );
  }
}
