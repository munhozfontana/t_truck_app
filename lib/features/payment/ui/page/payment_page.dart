import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/components/app_background.dart';
import '../../../../core/components/btn/btn_primary.dart';
import '../../../../core/components/btn/btn_voltar.dart';
import '../../../../core/components/layout/default_form.dart';
import 'payment_controller.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> with WidgetsBindingObserver {
  var controller = Get.find<PaymentController>();

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      controller.savePayment();
    }
    super.didChangeAppLifecycleState(state);
  }

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
              BtnPrimary(
                label: 'Cartão de crédito',
                onPressed: controller.typePayment.value.isCreditCard
                    ? () => controller.openPayment(FromPayment.CREDIT_CARD)
                    : null,
              ),
              Spacer(flex: 8),
              BtnPrimary(
                label: 'Boleto',
                onPressed: controller.typePayment.value.isBoleto
                    ? () => controller.takeImage(FromPayment.BOLETO)
                    : null,
              ),
              if (controller.typePayment.value.isWallet)
                ...secondaryPayment(
                    label: 'Carteira', fromPayment: FromPayment.WALLET),
              if (controller.typePayment.value.isBonus)
                ...secondaryPayment(
                    label: 'Bonificação', fromPayment: FromPayment.BONUS),
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

  List<Widget> secondaryPayment(
      {required label, required FromPayment fromPayment}) {
    return [
      Spacer(flex: 8),
      BtnPrimary(
        label: label,
        onPressed: () => controller.takeImage(fromPayment),
      )
    ];
  }
}
