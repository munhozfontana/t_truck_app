import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            TextField(
              // controller: ,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Login',
              ),
            ),
            TextField(
              // controller: ,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            )
          ],
        ),
      ),
    );
  }
}
