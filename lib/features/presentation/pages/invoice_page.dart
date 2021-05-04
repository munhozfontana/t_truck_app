import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:t_truck_app/features/presentation/components/app_background.dart';
import 'package:t_truck_app/features/presentation/controllers/invoice_controller.dart';
import 'package:t_truck_app/features/presentation/styles/style_inputs.dart';
import 'package:t_truck_app/features/presentation/styles/style_typograph.dart';

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
                  return Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(
                          flex: 041,
                        ),
                        TextFormField(
                          decoration: StyleInputs.inputDecorationLogin,
                        ),
                        Spacer(
                          flex: 035,
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: Text(
                            '48 clientes encontrados',
                            style: StyleTypograph.h4_w500_tertiary,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Spacer(
                          flex: 035,
                        ),
                        Flexible(
                          flex: 751,
                          child: ListView.separated(
                            separatorBuilder: (_, __) => SizedBox(height: 16),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return InvoiceItem();
                            },
                          ),
                        )
                      ],
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

class InvoiceItem extends StatelessWidget {
  const InvoiceItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          children: [
            background(constraints),
            content(constraints),
          ],
        );
      },
    );
  }

  Opacity background(BoxConstraints constraints) {
    return Opacity(
      opacity: 0.20000000298023224,
      child: Container(
        width: constraints.maxWidth,
        height: 88,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border.all(
            color: const Color(0xff090f32),
            width: 1,
          ),
        ),
      ),
    );
  }

  Padding content(BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mercado Dona de Casa',
            style: const TextStyle(
              color: Color(0xff090f31),
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
              fontStyle: FontStyle.normal,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 9,
          ),
          Row(
            children: [
              Container(
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.20000000298023224,
                      child: Container(
                        width: 56.999996185302734,
                        height: 24,
                        decoration: BoxDecoration(
                          color: const Color(0xffffe600),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 56.999996185302734,
                      height: 24,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '2',
                          style: const TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 9,
              ),
              Opacity(
                opacity: 0.5,
                child: Text('Qtd. de notas',
                    style: const TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left),
              )
            ],
          ),
        ],
      ),
    );
  }
}
