import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dont_env;
import 'package:get/get.dart';

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
import 'injection_container.dart';

void main() async {
  await dont_env.load(fileName: '.env');
  await SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(GetMaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xff090f31),
      accentColor: Color(0xff4f5262),
      buttonColor: Color(0xff090f31),
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
    ),
    initialBinding: MainBiding(),
    initialRoute: '/',
    getPages: [
      GetPage(
        name: '/',
        page: () => LoginPage(),
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
        page: () => OccurrenceReasonPage(),
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
        name: 'camera/show_picture',
        page: () => ShowPicture(),
      )
    ],
  ));
}
