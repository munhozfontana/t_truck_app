import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/utils/app_utils.dart';
import 'package:t_truck_app/features/clients/client_detail/ui/page/client_detail_controller.dart';

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
  Rx<AppLifecycleState> appLifecycleState = AppLifecycleState.resumed.obs;
  RxBool loadAccessCielo = false.obs;

  PaymentController({
    required this.identifyTypePaymentCase,
    required this.openPaymentUseCase,
    required this.savePaymentUseCase,
  });

  @override
  void onInit() {
    if (Get.find<ClientDetailController>().jump.value) {
      SchedulerBinding.instance!.addPostFrameCallback((_) {
        AppUtils.diaolog(onConfirm: () => Get.to(() => TakePicturePage()));
      });
    } else {
      changeLoading(Loading.START);
      typeOccurrence.value = Get.arguments[0];
      clientModel.value = Get.arguments[1];

      identifyTypePaymentCase(Params(clientModel: clientModel.value)).fold(
        (l) => null,
        (r) => typePayment.value = r,
      );
    }

    super.onInit();
  }

  void savePayment() async {
    (await savePaymentUseCase(Params(
      clientModel: clientModel.value,
    )))
        .fold(
      (l) => {AppUtils.error(menssagem: l.props.first.toString())},
      (r) => Get.to(() => TakePicturePage()),
    );
  }

  void openPayment(FromPayment fp) async {
    loadAccessCielo.value = true;
    loadAccessCielo.refresh();
    fromPayment.value = fp;
    clientModelToCredit();

    await openPaymentUseCase(Params(clientModel: clientModel.value));

    Timer(Duration(seconds: 60), () {
      print(appLifecycleState.value);
      if (appLifecycleState.value != AppLifecycleState.paused &&
          loadAccessCielo.isTrue) {
        loadAccessCielo.value = false;
        AppUtils.error(
            menssagem:
                'Serviço da cielo indisponível no momento. Tente novamente');
      }
    });
  }

  void clientModelToCredit() {
    clientModel.value = clientModel.value.copyWith(
        paymentTypeGsa: clientModel.value.paymentTypeGsa!
            .where((e) => e.valorCartao! > 0)
            .toList());
  }

  void takeImage(FromPayment fp) {
    fromPayment.value = fp;
    Get.to(() => TakePicturePage());
  }
}
