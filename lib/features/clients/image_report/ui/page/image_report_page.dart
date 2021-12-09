import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/components/app_background.dart';
import 'package:t_truck_app/core/components/layout/default_form.dart';
import 'package:t_truck_app/core/utils/styles_fonts.dart';

import './image_report_controller.dart';

class ImageReportPage extends GetView<ImageReportController> {
  const ImageReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(),
          Obx(() {
            return DefaultForm(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () =>
                            controller.openReport(controller.list[index]),
                        minLeadingWidth: 17,
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                        title: Text(
                          'NF: ${controller.list[index].subDescription}',
                          style: StylesTypography.h16Bold,
                        ),
                        subtitle: Text(
                          'CLIENTE ${controller.list[index].description}',
                          style: StylesTypography.h14,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: controller.list.length,
                  ),
                )
              ],
            );
          }),
        ],
      ),
    );
  }
}
