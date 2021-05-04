import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dont_env;
import 'package:get/get.dart';
import 'package:t_truck_app/features/presentation/pages/invoice_page.dart';
import 'package:t_truck_app/features/presentation/pages/login_page.dart';
import 'package:t_truck_app/injection_container.dart';

void main() async {
  await dont_env.load(fileName: '.env');
  await SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(GetMaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialBinding: MainBiding(),
    getPages: [
      GetPage(
        name: '/',
        page: () => LoginPage(),
      ),
      GetPage(
        name: '/invoice',
        page: () => InvoicePage(),
      ),
    ],
  ));
}
