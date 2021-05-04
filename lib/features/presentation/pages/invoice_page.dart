import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:t_truck_app/features/presentation/controllers/invoice_controller.dart';

class InvoicePage extends StatelessWidget {
  final InvoiceController controller =
      Get.put(InvoiceController(invoiceListUseCase: Get.find()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Page 2'),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: Get.back),
    );
  }
}
