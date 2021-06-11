import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/clients/list_clients/data/models/client_model.dart';
import 'package:t_truck_app/features/payment/domain/entites/type_payment.dart';
import 'package:t_truck_app/features/payment/domain/use_cases/identify_type_payment_case.dart';

import '../../../../core/utils/base_controller.dart';

class PaymentController extends GetxController with BaseController {
  final IdentifyTypePaymentCase identifyTypePaymentCase;

  Rx<ClientModel?> clientEntity = ClientModel().obs;
  Rx<TypePayment> typePayment = TypePayment().obs;

  PaymentController({
    required this.identifyTypePaymentCase,
  });

  @override
  void onInit() {
    changeLoading(Loading.START);
    clientEntity.value = Get.arguments[1];
    identifyTypePaymentCase(Params(clientEntity: clientEntity.value)).fold(
      (l) => null,
      (r) => typePayment.value = r,
    );

    super.onInit();
  }

  void payCredito() async {}

  void payBoleto() {
    // Get.to(() => CameraProofPage());
  }
}
