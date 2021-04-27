import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dont_env;
import 'package:t_truck_app/features/presentation/pages/login_page.dart';

import 'injection_container.dart' as di;

void main() async {
  await dont_env.load(fileName: '.env');
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
