import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:t_truck_app/features/presentation/controllers/base_controller.dart';
import 'package:t_truck_app/features/presentation/controllers/login_controller.dart';
import 'package:t_truck_app/injection_container.dart';

class LoginPage extends StatelessWidget {
  final controller = sl<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RxBuilder(
        builder: (_) {
          return Center(
            child: Column(
              children: [
                Visibility(
                  visible: controller.loadingState.value == Loading.START,
                  child: CircularProgressIndicator(),
                ),
                Visibility(
                  visible: controller.loadingState.value == Loading.STOP,
                  child: Column(
                    children: [
                      Text(controller.loginField.value),
                      TextFormField(
                        onChanged: (value) {
                          controller.loginField.value = value;
                        },
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your username',
                        ),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          controller.passwordField.value = value;
                        },
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your username',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.auth();
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}
