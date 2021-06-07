import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/components/app_background.dart';
import '../../../../../core/components/btn/btn_voltar.dart';
import '../../../../../core/components/btn_occurrence.dart';
import '../../../../../core/components/layout/default_form.dart';
import '../../../../../core/utils/base_controller.dart';
import '../../../../payment/payment_biding.dart';
import '../../../../payment/ui/page/payment_page.dart';
import '../../../list_clients/list_clients_biding.dart';
import '../../../list_clients/ui/page/list_client_page.dart';
import 'client_detail_controller.dart';

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
                                controller.clientEntity.value!.clientId
                                    .toString(),
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
                              controller.clientEntity.value!.cliente,
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
                                subLabel: controller.clientEntity.value!.qtde
                                    .toString(),
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              flex: 10,
                              child: ItemTest(
                                label: 'Qtd. de \nProdutos',
                                subLabel: controller
                                    .clientEntity.value!.produtos.length
                                    .toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      BtnOccurrence(
                        onTap: () {
                          Get.to(
                            () => PaymentPage(),
                            binding: PaymentBiding(),
                          );
                        },
                        label: 'Entrega total',
                        typeOccurrence: TypeOccurrence.GREEN,
                      ),
                      BtnOccurrence(
                        onTap: () {},
                        label: 'Devolução parcial',
                        typeOccurrence: TypeOccurrence.YELLOW,
                      ),
                      BtnOccurrence(
                        onTap: () {},
                        label: 'Devolução total',
                        typeOccurrence: TypeOccurrence.RED,
                      ),
                      Divider(),
                      BtnVoltar(
                        onTap: () => Get.offAll(
                          () => ListClientPage(),
                          binding: ListClientBiding(),
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
