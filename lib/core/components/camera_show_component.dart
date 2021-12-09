import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/components/app_background.dart';
import 'package:t_truck_app/core/components/btn/btn_primary.dart';
import 'package:t_truck_app/core/components/btn/btn_voltar.dart';
import 'package:t_truck_app/core/components/btn_occurrence.dart';
import 'package:t_truck_app/core/components/layout/default_form.dart';
import 'package:t_truck_app/features/clients/list_products/ui/page/list_products_page.dart';

import '../../../../../../core/components/app_background.dart';
import '../../../../../../core/components/btn/btn_primary.dart';
import '../../../../../../core/components/btn/btn_voltar.dart';
import '../../../../../../core/components/btn_occurrence.dart';
import '../../../../../../core/components/layout/default_form.dart';

class CameraShowComponent extends StatelessWidget {
  const CameraShowComponent({
    Key? key,
    required this.fileParamter,
    required this.onFinish,
  }) : super(key: key);

  final File fileParamter;
  final void Function()? onFinish;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(),
          DefaultForm(
            children: [
              Spacer(flex: 28),
              Image.file(
                fileParamter,
                fit: BoxFit.cover,
                height: 209.0,
                width: 2008.0,
              ),
              Spacer(flex: 6),
              Text(
                '*A foto precisa está legível',
                style: Get.textTheme.headline6,
                textAlign: TextAlign.left,
              ),
              Spacer(flex: 16),
              BtnPrimary(
                outline: true,
                label: 'Tirar outra foto',
                onPressed: () {
                  Get.to(
                    () => CameraCamera(
                      onFile: (file) {
                        Get.to(
                          CameraShowComponent(
                            fileParamter: file,
                            onFinish: onFinish,
                          ),
                          arguments: file,
                        );
                      },
                    ),
                  );
                },
              ),
              Spacer(flex: 4),
              BtnOccurrence(
                  typeOccurrence: TypeOccurrence.GREEN,
                  label: 'Finalizar Entrega',
                  onTap: onFinish),
              Spacer(flex: 14),
              Divider(),
              Spacer(flex: 14),
              BtnVoltar(
                  label: 'Voltar',
                  onTap: () => Get.off(
                        () => ListProductsPage(),
                      )),
              Spacer(flex: 14),
            ],
          ),
        ],
      ),
    );
  }
}
