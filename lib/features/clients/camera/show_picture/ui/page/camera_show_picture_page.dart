import 'dart:convert';
import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/components/app_background.dart';
import '../../../../../../core/components/btn/btn_primary.dart';
import '../../../../../../core/components/btn/btn_voltar.dart';
import '../../../../../../core/components/btn_occurrence.dart';
import '../../../../../../core/components/layout/default_form.dart';
import '../../../../../../injection_container.dart';
import '../../../../list_products/ui/page/list_products_page.dart';
import 'camera_show_picture_controller.dart';

class ShowPicture extends GetWidget<CameraImageController> {
  const ShowPicture({
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
                          ShowPicture(),
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
