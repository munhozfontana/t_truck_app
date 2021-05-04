import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:t_truck_app/features/presentation/components/app_background.dart';
import 'package:t_truck_app/features/presentation/controllers/invoice_controller.dart';
import 'package:t_truck_app/features/presentation/styles/style_inputs.dart';

class InvoicePage extends StatelessWidget {
  final InvoiceController controller =
      Get.put(InvoiceController(invoiceListUseCase: Get.find()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(
            initialScreen: false,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: alinhaFormParaBaixo(
              context,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: constraints.maxHeight * .041),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            // controller: controller.loginField.value,
                            decoration: StyleInputs.inputDecorationLogin,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: Get.back),
    );
  }

  Widget alinhaFormParaBaixo(context, {required Widget? child}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .868,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(8, 14, 49, 0.12),
            spreadRadius: 5,
            blurRadius: 32,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth * .064,
            ),
            child: child,
          );
        },
      ),
    );
  }
}
