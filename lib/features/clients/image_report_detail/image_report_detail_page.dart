import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/components/app_background.dart';
import 'package:t_truck_app/core/components/btn/btn_primary.dart';
import 'package:t_truck_app/core/components/layout/default_form.dart';
import 'package:t_truck_app/core/utils/style_colors.dart';
import 'package:t_truck_app/core/utils/styles_fonts.dart';
import 'package:t_truck_app/features/clients/image_report_upload/image_report_upload_bindings.dart';
import 'package:t_truck_app/features/clients/image_report_upload/image_report_upload_page.dart';

import './image_report_detail_controller.dart';

class ImageReportDetailPage extends GetView<ImageReportDetailController> {
  const ImageReportDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(),
          DefaultForm(
            children: [
              Text(
                '${controller.imageReportModel!.value.description} - ${controller.imageReportModel!.value.subDescription}',
                style: StylesTypography.h16Bold,
              ),
              Divider(),
              Expanded(
                flex: 12,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        children: [
                          Image.asset(
                            'images/fallback-photo.png',
                            fit: BoxFit.fitWidth,
                            width: constraints.maxWidth,
                          ),
                          Center(
                            child: Container(
                              color: Colors.black.withOpacity(.8),
                              width: double.infinity,
                              height: 40,
                              child: Center(
                                child: Text(
                                  'Imagem ilustrativa',
                                  style: StylesTypography.h24.copyWith(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '0%',
                    style: StylesTypography.h16,
                  ),
                  Text(
                    '50%',
                    style: StylesTypography.h16,
                  ),
                  Text(
                    '100%',
                    style: StylesTypography.h16,
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: LinearProgressIndicator(
                  value: controller.getPercent(controller.imageReportModel),
                  minHeight: 14,
                  color: StylesColors.blue2,
                  backgroundColor: StylesColors.gray245,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Imagem com qualidade inferior',
                    style: StylesTypography.h16,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 14,
              ),
              BtnPrimary(
                outline: true,
                label: 'Tirar outra foto',
                onPressed: () {
                  Get.to(
                    () => CameraCamera(
                      onFile: (file) {
                        Get.to(
                          ImageReportUploadPage(),
                          arguments: file,
                          binding: ImageReportUploadBindings(),
                        );
                      },
                    ),
                  );
                },
              ),
              Spacer(
                flex: 10,
              )
            ],
          ),
        ],
      ),
    );
  }
}
