import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dont_env;
import 'package:get/get.dart';
import 'package:t_truck_app/features/presentation/pages/camera/camera_image/camera_image_page.dart';
import 'package:t_truck_app/features/presentation/pages/camera/camera_proof/camera_proof_page.dart';
import 'package:t_truck_app/features/presentation/pages/devolution/devolution_finish/devolution_finish.dart';
import 'package:t_truck_app/features/presentation/pages/devolution/devolution_page.dart';
import 'package:t_truck_app/features/presentation/pages/login/login_page.dart';
import 'package:t_truck_app/features/presentation/pages/occurrence_reason/occurrence_reason_page.dart';
import 'package:t_truck_app/features/presentation/pages/order/order_page.dart';
import 'package:t_truck_app/features/presentation/pages/payment/payment_page.dart';
import 'package:t_truck_app/features/presentation/pages/product/product_page.dart';
import 'package:t_truck_app/features/presentation/styles/global_style.dart';
import 'package:t_truck_app/injection_container.dart';

void main() async {
  await dont_env.load(fileName: '.env');
  await SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(GetMaterialApp(
    title: 'GSA',
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xff090f31),
      accentColor: Color(0xff4f5262),
      buttonColor: Color(0xff090f31),
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
        name: '/order',
        page: () => OrderPage(),
      ),
      GetPage(
        name: '/product',
        page: () => ProductPage(),
      ),
      GetPage(
        name: '/product/devolution',
        page: () => DevolutionPage(),
      ),
      GetPage(
        name: '/product/devolution/reason',
        page: () => OccurrenceReasonPage(),
      ),
      GetPage(
        name: '/product/devolution/finish',
        page: () => DevolutionFinish(),
      ),
      GetPage(
        name: '/payment',
        page: () => PaymentPage(),
      ),
      GetPage(
        name: 'camera/proof',
        page: () => CameraProofPage(),
      ),
      GetPage(
        name: 'camera/image',
        page: () => CameraImagePage(),
      )
    ],
  ));
}
