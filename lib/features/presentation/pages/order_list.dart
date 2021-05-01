import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Page 2'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Get.back,
      ),
    );
  }
}
