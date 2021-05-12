import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/presentation/components/app_background.dart';
import 'package:t_truck_app/features/presentation/components/btn/btn_voltar.dart';
import 'package:t_truck_app/features/presentation/components/btn_devolution.dart';
import 'package:t_truck_app/features/presentation/components/dropdown_default.dart';
import 'package:t_truck_app/features/presentation/components/layout/default_form.dart';
import 'package:t_truck_app/features/presentation/pages/devolution_reason/devolution_reason_controller.dart';

class DevolutionReasonPage extends GetView<DevolutionReasonController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DevolutionReasonController());

    return Scaffold(
      body: Stack(
        children: [
          AppBackground(),
          DefaultForm(child: [
            Spacer(flex: 34),
            Container(
                width: 184.5446014404297,
                height: 146.3734588623047,
                child: Icon(Icons.add_box)),
            Spacer(flex: 22),
            ClienteDropdownButton(
              onChange: print,
              items: [
                DropdownModel(id: 1, label: 'teste'),
              ],
            ),
            Spacer(flex: 39),
            BtnDevolution(
                typeDevolution: TypeDevolution.GREEN,
                label: 'Finalizar entrega',
                onTap: controller.finishReson),
            Spacer(flex: 172),
            Divider(),
            Spacer(flex: 45),
            BtnVoltar(
              onTap: controller.back,
              label: 'Voltar',
            ),
            Spacer(flex: 59)
          ])
        ],
      ),
    );
  }
}
