import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/components/app_background.dart';
import '../../../../../core/components/btn/btn_primary.dart';
import '../../../../../core/components/help_component.dart';
import '../../../../../core/components/layout/default_form.dart';
import '../../../../../injection_container.dart';
import '../../../list_clients/ui/page/list_client_page.dart';

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
                  Get.offAll(() => ListClientPage(), binding: OrderBiding());
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
