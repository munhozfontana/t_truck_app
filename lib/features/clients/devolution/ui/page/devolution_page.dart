import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/clients/list_products/ui/page/list_products_page.dart';

import '../../../../../core/components/app_background.dart';
import '../../../../../core/components/btn/btn_voltar.dart';
import '../../../../../core/components/btn_occurrence.dart';
import '../../../../../core/components/dropdown_default.dart';
import '../../../../../core/components/layout/default_form.dart';
import 'devolution_controller.dart';

class OccurrenceReasonPage extends GetView<OccurrenceReasonController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(),
          DefaultForm(children: [
            Spacer(flex: 28),
            Center(
              child: Container(
                width: 175.5446014404297,
                height: 147.3734588623047,
                child: ColorFiltered(
                  colorFilter:
                      ColorFilter.mode(Color(0xFFd0cdcd), BlendMode.dstIn),
                  child: Image.asset(
                    'images/box.gif',
                    height: 125.0,
                    width: 125.0,
                  ),
                ),
              ),
            ),
            Spacer(flex: 32),
            Obx(() => ClienteDropdownButton(
                  onChange: controller.changeDropdown,
                  items: controller.reasonDevolution,
                  isLoading: controller.isLoading,
                )),
            Spacer(flex: 8),
            BtnOccurrence(
                typeOccurrence: TypeOccurrence.GREEN,
                label: 'Finalizar entrega',
                onTap: controller.finishReson),
            Spacer(flex: 14),
            Divider(),
            Spacer(flex: 14),
            BtnVoltar(
              onTap: () => Get.off(() => ListProductsPage()),
              label: 'Voltar',
            ),
            Spacer(flex: 14)
          ])
        ],
      ),
    );
  }
}
