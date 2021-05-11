import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/presentation/components/app_background.dart';
import 'package:t_truck_app/features/presentation/components/btn_devolution.dart';
import 'package:t_truck_app/features/presentation/components/layout/layout_form.dart';
import 'package:t_truck_app/features/presentation/pages/delivery/delivery_controller.dart';
import 'package:t_truck_app/features/presentation/pages/order/order_page.dart';
import 'package:t_truck_app/features/presentation/pages/payment/payment_page.dart';
import 'package:t_truck_app/injection_container.dart';

class DeliveryPage extends GetWidget<DeliveryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(),
          LayoutForm(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: constraints.maxHeight * .041,
                    bottom: constraints.maxHeight * .068,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * .097,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          border: Border.all(
                            color: const Color(0xff080e31)
                                .withOpacity(0.20000000298023224),
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                                controller.orderEntity.value!.codCli.toString(),
                                style: Get.textTheme.headline6),
                          ),
                        ),
                      ),
                      Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * .097,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          border: Border.all(
                            color: const Color(0xff080e31)
                                .withOpacity(0.20000000298023224),
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              controller.orderEntity.value!.cliente,
                              style: const TextStyle(
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Poppins',
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              Opacity(
                                opacity: 0.10000000149011612,
                                child: Container(
                                  width: constraints.maxWidth * .47,
                                  height: constraints.maxWidth * .421,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: const Color(0xffc4c4c4),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Qtd. de \nnotas fiscais',
                                        style: const TextStyle(
                                            color: Color(0xff090e32),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 18.0),
                                        textAlign: TextAlign.left),
                                    Obx(() => Text(
                                        controller.orderEntity.value!
                                            .identificacoes.length
                                            .toString(),
                                        style: const TextStyle(
                                            color: Color(0xff090e32),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 32.0),
                                        textAlign: TextAlign.left))
                                  ],
                                ),
                              )
                            ],
                          ),
                          Stack(
                            children: [
                              Opacity(
                                opacity: 0.10000000149011612,
                                child: Container(
                                  width: constraints.maxWidth * .47,
                                  height: constraints.maxWidth * .421,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: const Color(0xffc4c4c4),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Qtd. de \nProdutos',
                                        style: const TextStyle(
                                            color: Color(0xff090e32),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 18.0),
                                        textAlign: TextAlign.left),
                                    Obx(() => Text(
                                        controller.productEntityList.length
                                            .toString(),
                                        style: const TextStyle(
                                            color: Color(0xff090e32),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 32.0),
                                        textAlign: TextAlign.left))
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      BtnDevolution(
                        onTap: () {
                          Get.to(() => PaymentPage());
                        },
                        label: 'Entrega total',
                        typeDevolution: TypeDevolution.GREEN,
                      ),
                      BtnDevolution(
                        onTap: () {
                          controller.toDevolution(TypeDevolution.YELLOW);
                        },
                        label: 'Devolução parcial',
                        typeDevolution: TypeDevolution.YELLOW,
                      ),
                      BtnDevolution(
                        onTap: () {
                          controller.toDevolution(TypeDevolution.RED);
                        },
                        label: 'Devolução total',
                        typeDevolution: TypeDevolution.RED,
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () =>
                            Get.off(() => OrderPage(), binding: OrderBiding()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.keyboard_arrow_left_rounded),
                            Text('Voltar para listar cliente',
                                style: const TextStyle(
                                    color: Color(0xff6c6c6c),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.left)
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
