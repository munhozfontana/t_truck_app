import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/utils/style_colors.dart';
import 'package:t_truck_app/core/utils/styles_fonts.dart';
import 'package:t_truck_app/features/clients/image_report/image_report_bindings.dart';
import 'package:t_truck_app/features/clients/image_report/ui/page/image_report_page.dart';

import './app_drawer_controller.dart';

class AppDrawer extends GetView<AppDrawerController> {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 261,
      child: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    height: 88,
                    child: DrawerHeader(
                      padding: EdgeInsets.only(
                        bottom: 15,
                        top: 15,
                        right: 179,
                        left: 24,
                      ),
                      child: SvgPicture.asset(
                        'images/logo.svg',
                        semanticsLabel: 'Background Logo',
                      ),
                    ),
                  ),
                  ...ListTile.divideTiles(
                    context: context,
                    tiles: [
                      ListTile(
                        minLeadingWidth: 17,
                        leading: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.black,
                        ),
                        title: Text(
                          'Imagens canhotos',
                          style: StylesTypography.h16Bold,
                        ),
                        onTap: () {
                          Get.offAll(() => ImageReportPage(),
                              binding: ImageReportBindings());
                        },
                      ),
                    ],
                  ).toList(),
                ],
              ),
            ),
            GestureDetector(
              onTap: controller.closeDrawer,
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 23,
                ),
                child: Text(
                  'Sair',
                  style: StylesTypography.h16Bold.copyWith(
                    color: StylesColors.secondOrange,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
