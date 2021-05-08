import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dont_env;
import 'package:get/get.dart';
import 'package:t_truck_app/features/presentation/pages/delivery_page.dart';
import 'package:t_truck_app/features/presentation/pages/login_page.dart';
import 'package:t_truck_app/features/presentation/pages/order_page.dart';
import 'package:t_truck_app/features/presentation/styles/style_typograph.dart';
import 'package:t_truck_app/injection_container.dart';

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
        textTheme: TextTheme(
          headline1: StyleTypograph.h1,
          headline2: StyleTypograph.h2,
          headline3: StyleTypograph.h3,
          headline4: StyleTypograph.h4,
          headline5: StyleTypograph.h4_w500,
          headline6: StyleTypograph.h4_w500_tertiary,
        )),
    initialBinding: MainBiding(),
    initialRoute: '/',
    getPages: [
      GetPage(
        name: '/',
        page: () => LoginPage(),
      ),
      GetPage(
        name: '/order',
        page: () => OrderPage(),
      ),
      GetPage(
        name: '/delivery',
        page: () => DeliveryPage(),
      )
    ],
  ));
}
