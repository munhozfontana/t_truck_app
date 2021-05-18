import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/presentation/components/app_background.dart';
import 'package:t_truck_app/features/presentation/components/btn/btn_primary.dart';
import 'package:t_truck_app/features/presentation/components/btn/btn_voltar.dart';
import 'package:t_truck_app/features/presentation/components/layout/default_form.dart';
import 'package:t_truck_app/features/presentation/pages/payment/payment_controller.dart';
import 'package:t_truck_app/features/presentation/pages/product/product_page.dart';

class PaymentPage extends GetWidget<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(),
          DefaultForm(
            child: [
              Spacer(flex: 28),
              Container(
                  width: 175.5446014404297,
                  height: 147.3734588623047,
                  child: SvgPicture.asset(
                    'images/payment.svg',
                    semanticsLabel: 'Background Logo',
                  )),
              Spacer(flex: 33),
              BtnPrimary(
                label: 'Cartão de crédito',
                onPressed: controller.pay,
              ),
              Spacer(flex: 16),
              BtnPrimary(
                label: 'Boleto bancário',
                onPressed: () {},
              ),
              Spacer(flex: 46),
              Divider(),
              Spacer(flex: 21),
              BtnVoltar(
                  label: 'Voltar', onTap: () => Get.to(() => ProductPage())),
              Spacer(flex: 38)
            ],
          )
        ],
      ),
    );
  }
}
