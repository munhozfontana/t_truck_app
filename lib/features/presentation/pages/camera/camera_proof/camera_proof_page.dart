import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/presentation/components/app_background.dart';
import 'package:t_truck_app/features/presentation/components/btn/btn_primary.dart';
import 'package:t_truck_app/features/presentation/components/layout/default_form.dart';
import 'package:t_truck_app/features/presentation/pages/camera/camera_image/camera_image_page.dart';
import 'package:t_truck_app/injection_container.dart';

class CameraProofPage extends StatelessWidget {
  @override
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
                          CameraImagePage(),
                          arguments: file,
                          binding: CameraImageBiding(),
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
