import 'dart:convert';
import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/presentation/components/app_background.dart';
import 'package:t_truck_app/features/presentation/components/btn/btn_primary.dart';
import 'package:t_truck_app/features/presentation/components/btn/btn_voltar.dart';
import 'package:t_truck_app/features/presentation/components/btn_occurrence.dart';
import 'package:t_truck_app/features/presentation/components/layout/default_form.dart';
import 'package:t_truck_app/features/presentation/pages/camera/camera_image/camera_image_controller.dart';
import 'package:t_truck_app/features/presentation/pages/product/product_page.dart';
import 'package:t_truck_app/injection_container.dart';

class CameraImagePage extends GetWidget<CameraImageController> {
  const CameraImagePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    File fileParamter = Get.arguments!;
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
                          CameraImagePage(),
                          arguments: file,
                          binding: CameraImageBiding(),
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
                  onTap: () => {
                        controller.saveImage(
                            base64Encode(fileParamter.readAsBytesSync()))
                      }),
              Spacer(flex: 14),
              Divider(),
              Spacer(flex: 14),
              BtnVoltar(
                  label: 'Voltar',
                  onTap: () => Get.off(
                        () => ProductPage(),
                      )),
              Spacer(flex: 14),
            ],
          ),
        ],
      ),
    );
  }
}
