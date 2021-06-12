import 'package:get/get.dart';

import '../../../../core/params/params.dart';
import '../../../../core/utils/base_controller.dart';
import '../../../clients/camera/take_picture/ui/page/camera_take_picture_page.dart';
import '../../../clients/list_clients/data/models/client_model.dart';
import '../../domain/entites/type_payment.dart';
import '../../domain/use_cases/identify_type_payment_case.dart';
import '../../domain/use_cases/open_payment_use_case.dart';

class PaymentController extends GetxController with BaseController {
  final IdentifyTypePaymentCase identifyTypePaymentCase;
  final OpenPaymentUseCase openPaymentUseCase;
  Rx<ClientModel?> clientModel = ClientModel().obs;
  Rx<TypePayment> typePayment = TypePayment().obs;

  PaymentController({
    required this.identifyTypePaymentCase,
    required this.openPaymentUseCase,
  });

  @override
  void onInit() {
    changeLoading(Loading.START);
    clientModel.value = Get.arguments[1];
    identifyTypePaymentCase(Params(clinetModel: clientModel.value)).fold(
      (l) => null,
      (r) => typePayment.value = r,
    );

    super.onInit();
  }

  void payCredito() async {
    await openPaymentUseCase(Params(clinetModel: clientModel.value));
  }

  void payBoleto() {
    Get.to(() => TakePicturePage());
  }
}
