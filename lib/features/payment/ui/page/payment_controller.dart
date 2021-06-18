import 'package:get/get.dart';

import '../../../../core/components/btn_occurrence.dart';
import '../../../../core/params/params.dart';
import '../../../../core/utils/base_controller.dart';
import '../../../clients/camera/take_picture/ui/page/camera_take_picture_page.dart';
import '../../../clients/list_clients/data/models/client_model.dart';
import '../../domain/entites/type_payment.dart';
import '../../domain/use_cases/identify_type_payment_case.dart';
import '../../domain/use_cases/open_payment_use_case.dart';
import '../../domain/use_cases/save_payment_use_case.dart';

enum FromPayment { BONUS, CREDIT_CARD, BOLETO, WALLET, NONE }

class PaymentController extends GetxController with BaseController {
  final IdentifyTypePaymentCase identifyTypePaymentCase;
  final OpenPaymentUseCase openPaymentUseCase;
  final SavePaymentUseCase savePaymentUseCase;

  Rx<ClientModel> clientModel = ClientModel().obs;
  Rx<TypePayment> typePayment = TypePayment().obs;
  Rx<TypeOccurrence> typeOccurrence = TypeOccurrence.NONE.obs;
  Rx<FromPayment> fromPayment = FromPayment.NONE.obs;

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

  void savePayment() async {
    await (await savePaymentUseCase(Params(
      clientModel: clientModel.value,
    )))
        .fold(
      (l) => null,
      (r) => Get.to(() => TakePicturePage()),
    );
    ;
  }

  void openPayment(FromPayment fp) async {
    fromPayment.value = fp;
    await openPaymentUseCase(Params(clientModel: clientModel.value));
  }

  void takeImage(FromPayment fp) {
    fromPayment.value = fp;
    Get.to(() => TakePicturePage());
  }
}
