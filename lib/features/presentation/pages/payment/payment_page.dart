import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/error/driver_exception.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_channel.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_channel_impl.dart';
import 'package:t_truck_app/features/presentation/components/app_background.dart';
import 'package:t_truck_app/features/presentation/components/btn/btn_primary.dart';
import 'package:t_truck_app/features/presentation/components/btn/btn_voltar.dart';
import 'package:t_truck_app/features/presentation/components/layout/default_form.dart';
import 'package:t_truck_app/features/presentation/pages/delivery/delivery_page.dart';
import 'package:t_truck_app/features/presentation/pages/order/order_page.dart';

class PaymentPage extends StatelessWidget {
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
                onPressed: callPay,
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
                  label: 'Voltar', onTap: () => Get.to(() => DeliveryPage())),
              Spacer(flex: 38)
            ],
          )
        ],
      ),
    );
  }

  void callPay() async {
    try {
      var cieloCredentials = CieloCredentials()
        ..clientID = env['CLIENT_ID_CIELO']
        ..accessToken = env['ACCESS_TOKEN_CIELO'];

      var arg = PayParam()
        ..reference = 'MINHA REFERENCIA FLUTTER'
        ..cieloCredentials = cieloCredentials
        ..valorTotal = 500000
        ..paymentCode = Payment.CREDITO_PARCELADO_ADM.code
        ..installments = 5
        // ..email = "teste@gmail.com"
        ..items = [
          {
            'sku': '2891820317391823',
            'name': 'coca',
            'unitPrice': 550,
            'quantity': 1,
            'unitOfMeasure': 'UNIT',
          }
        ];

      var res = await CieloRun().pay(arg);
      await Get.off(() => OrderPage());
      print(res);
    } catch (e) {
      throw DriverException(error: e.toString());
    }
  }
}
