import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/presentation/components/app_background.dart';
import 'package:t_truck_app/features/presentation/components/btn/btn_primary.dart';
import 'package:t_truck_app/features/presentation/components/help_component.dart';
import 'package:t_truck_app/features/presentation/components/layout/default_form.dart';
import 'package:t_truck_app/features/presentation/pages/order/order_page.dart';
import 'package:t_truck_app/injection_container.dart';

class DevolutionFinish extends StatelessWidget {
  final bool isDevolutionTotal;

  const DevolutionFinish({
    Key? key,
    this.isDevolutionTotal = false,
  }) : super(key: key);

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
                  child: ColorFiltered(
                    colorFilter:
                        ColorFilter.mode(Color(0xFFd0cdcd), BlendMode.dstIn),
                    child: Image.asset(
                      'images/box_open.gif',
                      height: 125.0,
                      width: 125.0,
                    ),
                  ),
                ),
              ),
              Spacer(flex: 33),
              Text(
                !isDevolutionTotal
                    ? 'Entrega concluida com sucesso'
                    : 'Devolução concluida com sucesso',
                style: Get.textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 16),
              BtnPrimary(
                label: 'Voltar para o início',
                onPressed: () {
                  Get.offAll(() => OrderPage(), binding: OrderBiding());
                },
              ),
              Spacer(flex: 14),
              Divider(),
              Spacer(flex: 14),
              HelpComponent(),
              Spacer(flex: 14),
            ],
          ),
        ],
      ),
    );
  }
}
