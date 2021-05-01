import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/presentation/components/components_login/login_background.dart';
import 'package:t_truck_app/features/presentation/components/components_login/login_content.dart';
import 'package:t_truck_app/features/presentation/controllers/login_controller.dart';

class LoginPage extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            LoginBackground(),
            LoginContent(),
          ],
        ),
      ),
    );
  }
}
