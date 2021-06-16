import 'package:get/get.dart';
import 'package:t_truck_app/core/components/btn_occurrence.dart';
import 'package:t_truck_app/features/payment/domain/entites/type_payment.dart';
import 'package:t_truck_app/features/payment/domain/use_cases/save_payment_use_case.dart';

import '../../../../core/params/params.dart';
import '../../../../core/utils/base_controller.dart';
import '../../../clients/camera/take_picture/ui/page/camera_take_picture_page.dart';
import '../../../clients/list_clients/data/models/client_model.dart';
import '../../domain/use_cases/identify_type_payment_case.dart';
import '../../domain/use_cases/open_payment_use_case.dart';

class PaymentController extends GetxController with BaseController {
  final IdentifyTypePaymentCase identifyTypePaymentCase;
  final OpenPaymentUseCase openPaymentUseCase;
  final SavePaymentUseCase savePaymentUseCase;
  Rx<ClientModel?> clientModel = ClientModel().obs;
  Rx<TypePayment> typePayment = TypePayment().obs;
  Rx<TypeOccurrence> typeOccurrence = TypeOccurrence.NONE.obs;

  PaymentController({
    required this.identifyTypePaymentCase,
    required this.openPaymentUseCase,
    required this.savePaymentUseCase,
  });

  @override
  void onInit() {
    changeLoading(Loading.START);
    typeOccurrence.value = Get.arguments[0];
    clientModel.value = Get.arguments[1];
    identifyTypePaymentCase(Params(clientModel: clientModel.value)).fold(
      (l) => null,
      (r) => typePayment.value = r,
    );

    super.onInit();
  }

  void openPayment() async {
    await openPaymentUseCase(Params(clientModel: clientModel.value));
  }

  void savePayment() {
    Get.to(() => TakePicturePage());
  }

  void payBoleto() {
    Get.to(() => TakePicturePage());
  }
}
