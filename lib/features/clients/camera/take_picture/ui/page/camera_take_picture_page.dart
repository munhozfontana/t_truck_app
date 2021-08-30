import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/components/app_background.dart';
import '../../../../../../core/components/btn/btn_primary.dart';
import '../../../../../../core/components/layout/default_form.dart';
import '../../../show_picture/ui/page/camera_show_picture_page.dart';
import '../../../show_picture_biding.dart';

class TakePicturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(),
          DefaultForm(
            children: [
              Spacer(flex: 28),
              Image.asset(
                'images/camera_proof.png',
                height: 209.0,
                width: 2008.0,
              ),
              Spacer(flex: 33),
              Text(
                'Tire a foto do canhoto da nota fiscal.',
                style: Get.textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 16),
              BtnPrimary(
                label: 'Tirar foto',
                onPressed: () {
                  Get.to(
                    () => CameraCamera(
                      onFile: (file) {
                        Get.to(
                          ShowPicture(),
                          arguments: file,
                          binding: ShowPictureBiding(),
                        );
                      },
                    ),
                  );
                },
              ),
              Spacer(flex: 14),
              Divider(),
              Spacer(flex: 14),
            ],
          ),
        ],
      ),
    );
  }
}
