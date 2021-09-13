import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dont_env;
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:t_truck_app/features/chat/ui/chat_component.dart';
import 'package:t_truck_app/features/chat/ui/chat_controller.dart';

import 'core/utils/global_style.dart';
import 'features/clients/camera/show_picture/ui/page/camera_show_picture_page.dart';
import 'features/clients/camera/take_picture/ui/page/camera_take_picture_page.dart';
import 'features/clients/client_detail/ui/page/client_detail_page.dart';
import 'features/clients/devolution/ui/page/devolution_page.dart';
import 'features/clients/finish/ui/page/devolution_finish.dart';
import 'features/clients/list_clients/ui/page/list_client_page.dart';
import 'features/clients/list_products/ui/page/list_products_page.dart';
import 'features/login/login_biding.dart';
import 'features/login/ui/page/login_page.dart';
import 'features/payment/ui/page/payment_page.dart';
import 'features/splash/ui/splash.dart';
import 'injection_container.dart';

void main() async {
  await dont_env.load(fileName: '.env');
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  var packageInfo;

  if (!Platform.isWindows) {
    packageInfo = await PackageInfo.fromPlatform();
  }

  runApp(GetMaterialApp(
    title: 'GSA',
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xff090f31),
      disabledColor: Colors.red,
      inputDecorationTheme: GlobalStyle.inputDecoration(),
      textTheme: TextTheme(
        headline1: GlobalStyle.h1,
        headline2: GlobalStyle.h2,
        headline3: GlobalStyle.h3,
        headline4: GlobalStyle.h4,
        headline5: GlobalStyle.h4_w500,
        headline6: GlobalStyle.h4_w500_tertiary,
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Color(0xff4f5262)),
    ),
    initialBinding: MainBiding(),
    initialRoute: '/',
    builder: (context, child) {
      return Stack(
        children: [
          child!,
          Obx(
            () => Visibility(
              visible: Get.find<ChatController>().chat.value,
              child: ChatComponent(),
            ),
          ),
        ],
      );
    },
    getPages: [
      GetPage(
        name: '/',
        page: () {
          return FutureBuilder(
            future: Future.delayed(Duration(seconds: 4)),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return MaterialApp(
                    home: Splash(
                  packageInfo: packageInfo,
                ));
              } else {
                return LoginPage();
              }
            },
          );
        },
        bindings: [
          LoginBiding(),
        ],
      ),
      GetPage(
        name: '/list_clients',
        page: () => ListClientPage(),
      ),
      GetPage(
        name: '/list_clients/client_detail',
        page: () => ClientDetailPage(),
      ),
      GetPage(
        name: '/list_clients/client_detail/list_products',
        page: () => ListProductsPage(),
      ),
      GetPage(
        name: '/list_clients/client_detail/devolution',
        page: () => DevolutionPage(),
      ),
      GetPage(
        name: '/list_clients/devolution/finish',
        page: () => DevolutionFinish(),
      ),
      GetPage(
        name: '/payment',
        page: () => PaymentPage(),
      ),
      GetPage(
        name: 'camera/tak_picture',
        page: () => TakePicturePage(),
      ),
      GetPage(
        name: '/chat',
        page: () => ChatComponent(),
      ),
      GetPage(
        name: 'camera/show_picture',
        page: () => ShowPicture(),
      )
    ],
  ));
}
