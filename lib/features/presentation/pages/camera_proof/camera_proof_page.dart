import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/presentation/components/app_background.dart';
import 'package:t_truck_app/features/presentation/components/btn/btn_primary.dart';
import 'package:t_truck_app/features/presentation/components/layout/layout_form.dart';

class CameraProofPage extends StatefulWidget {
  final File? image;

  const CameraProofPage({Key? key, this.image}) : super(key: key);

  @override
  _CameraProofPageState createState() => _CameraProofPageState();
}

class _CameraProofPageState extends State<CameraProofPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(),
          LayoutForm(
            child: Column(
              children: [
                Spacer(flex: 28),
                GetUtils.isNull(widget.image)
                    ? Image.asset(
                        'images/camera_proof.png',
                        height: 209.0,
                        width: 2008.0,
                      )
                    : Image.file(
                        widget.image!,
                        fit: BoxFit.cover,
                        height: 209.0,
                        width: 2008.0,
                      ),
                Spacer(flex: 33),
                BtnPrimary(
                  label: 'Tirar foto',
                  onPressed: () {
                    Get.to(
                      () => CameraCamera(onFile: (file) {
                        Get.to(CameraProofPage(image: file));
                      }),
                    );
                  },
                ),
                Spacer(flex: 14),
                Divider(),
                Spacer(flex: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
