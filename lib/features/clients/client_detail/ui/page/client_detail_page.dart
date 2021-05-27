import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/presentation/components/app_background.dart';
import 'package:t_truck_app/features/presentation/components/btn/btn_voltar.dart';
import 'package:t_truck_app/features/presentation/components/btn_occurrence.dart';
import 'package:t_truck_app/features/presentation/components/layout/default_form.dart';
import 'package:t_truck_app/features/presentation/pages/clientdetail/clientdetail_controller.dart';
import 'package:t_truck_app/features/presentation/pages/clients/order_page.dart';
import 'package:t_truck_app/features/presentation/pages/payment/payment_page.dart';
import 'package:t_truck_app/features/presentation/utils/base_controller.dart';
import 'package:t_truck_app/injection_container.dart';

class ClientDetailPage extends GetWidget<ClientDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(),
          DefaultForm(
            builder: (context, constraints) {
              return Obx(
                () => Visibility(
                  visible: controller.loadingState.value != Loading.START,
                  replacement: Center(
                    child: CircularProgressIndicator(),
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
                      Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * .20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 10,
                              child: ItemTest(
                                label: 'Qtd. de \nnotas fiscais',
                                subLabel: controller.qtdNotas.value,
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              flex: 10,
                              child: ItemTest(
                                label: 'Qtd. de \nProdutos',
                                subLabel: controller.qtdProdutos.value,
                              ),
                            ),
                          ],
                        ),
                      ),
                      BtnOccurrence(
                        onTap: () {
                          Get.to(
                            () => PaymentPage(),
                            binding: OrderPayBiding(),
                            arguments: controller.orderEntity.value,
                          );
                        },
                        label: 'Entrega total',
                        typeOccurrence: TypeOccurrence.GREEN,
                      ),
                      BtnOccurrence(
                        onTap: () {
                          controller.toDevolution(TypeOccurrence.YELLOW);
                        },
                        label: 'Devolução parcial',
                        typeOccurrence: TypeOccurrence.YELLOW,
                      ),
                      BtnOccurrence(
                        onTap: () {
                          controller.toDevolution(TypeOccurrence.RED);
                        },
                        label: 'Devolução total',
                        typeOccurrence: TypeOccurrence.RED,
                      ),
                      Divider(),
                      BtnVoltar(
                        onTap: () => Get.offAll(
                          () => OrderPage(),
                          binding: OrderBiding(),
                        ),
                        label: 'Voltar para listar cliente',
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ItemTest extends StatelessWidget {
  final String label;
  final String subLabel;

  const ItemTest({
    Key? key,
    required this.label,
    required this.subLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, __) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: __.maxHeight,
          width: __.maxWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: const Color(0xffc4c4c4).withOpacity(0.10000000149011612),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                        color: Color(0xff090e32),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    subLabel,
                    style: const TextStyle(
                        color: Color(0xff090e32),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontSize: 32.0),
                    textAlign: TextAlign.left,
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
