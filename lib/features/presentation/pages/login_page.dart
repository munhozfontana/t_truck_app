import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/presentation/controllers/base_controller.dart';
import 'package:t_truck_app/features/presentation/controllers/login_controller.dart';

class LoginPage extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Obx(
          () => Form(
            key: controller.keyForm,
            child: Stack(
              children: [
                Column(
                  children: [
                    Center(
                      child: Text(
                        '${controller.loginField.text} ${controller.passwordField.text}',
                      ),
                    ),
                    TextFormField(
                      controller: controller.loginField,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your username',
                      ),
                    ),
                    TextFormField(
                      controller: controller.passwordField,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your username',
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: controller.loadingState.value == Loading.START,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.auth(),
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}
