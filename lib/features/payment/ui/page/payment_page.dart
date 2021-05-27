import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/components/app_background.dart';
import '../../../../core/components/btn/btn_voltar.dart';
import '../../../../core/components/layout/default_form.dart';
import 'payment_controller.dart';

class PaymentPage extends GetWidget<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(),
          DefaultForm(
            children: [
              Spacer(flex: 28),
              Center(
                child: Container(
                    width: 175.5446014404297,
                    height: 147.3734588623047,
                    child: SvgPicture.asset(
                      'images/payment.svg',
                      semanticsLabel: 'Background Logo',
                    )),
              ),
              Spacer(flex: 33),
              // BtnPrimary(
              // label: 'Cartão de crédito',
              // onPressed: controller.tipoTransacaoEntity
              // .where((element) =>
              // element.tipoTransacao == TipoTransacao.CREDITO)
              // .isNotEmpty
              // ? controller.payCartaoCredito
              // : null,
              // ),
              Spacer(flex: 8),
              // BtnPrimary(
              //   label: controller.botaoDinamico.value,
              //   onPressed: controller.tipoTransacaoEntity
              //           .where((element) =>
              //               element.tipoTransacao == TipoTransacao.BOLETO)
              //           .isNotEmpty
              //       ? controller.payDinamico
              //       : null,
              // ),
              Spacer(flex: 14),
              Divider(),
              Spacer(flex: 14),
              BtnVoltar(label: 'Voltar', onTap: () => Get.back()),
              Spacer(flex: 14)
            ],
          )
        ],
      ),
    );
  }
}
