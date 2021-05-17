import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/presentation/components/app_background.dart';
import 'package:t_truck_app/features/presentation/components/layout/layout_form.dart';
import 'package:t_truck_app/features/presentation/pages/delivery/delivery_page.dart';
import 'package:t_truck_app/features/presentation/pages/order/order_controller.dart';
import 'package:t_truck_app/features/presentation/utils/base_controller.dart';
import 'package:t_truck_app/injection_container.dart';

class OrderPage extends GetWidget<OrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          AppBackground(),
          LayoutForm(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(
                      flex: 041,
                    ),
                    TextFormField(
                      onChanged: controller.filterChanged,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search_rounded),
                          hintText: 'Pequisar cliente...',
                          hintStyle: Get.theme.textTheme.headline3),
                    ),
                    Spacer(
                      flex: 035,
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Obx(() => Text(
                            '${controller.filtredList.length} clientes encontrados',
                            style: Get.textTheme.headline6,
                            textAlign: TextAlign.left,
                          )),
                    ),
                    Spacer(
                      flex: 035,
                    ),
                    Flexible(
                      flex: 751,
                      child: Obx(() => RefreshIndicator(
                            onRefresh: controller.takeOrders,
                            child: ListView.separated(
                              separatorBuilder: (_, __) => SizedBox(height: 16),
                              itemCount: controller.filtredList.length,
                              itemBuilder: (context, index) {
                                return OrderItem(
                                  orderEntity: controller.filtredList[index],
                                );
                              },
                            ),
                          )),
                    )
                  ],
                );
              },
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.loadingState.value == Loading.START,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final OrderEntity orderEntity;

  const OrderItem({
    Key? key,
    required this.orderEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => DeliveryPage(),
          arguments: orderEntity,
          binding: DeliveryBiding(),
        );
      },
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: [
              background(constraints),
              content(constraints, orderEntity),
            ],
          );
        },
      ),
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

  Padding content(BoxConstraints constraints, OrderEntity orderEntity) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            orderEntity.cliente,
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
                          orderEntity.identificacoes.length.toString(),
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
