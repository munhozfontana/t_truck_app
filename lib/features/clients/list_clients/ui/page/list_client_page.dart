import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:t_truck_app/core/components/app_drawer/app_drawer.dart';

import '../../../../../core/components/app_background.dart';
import '../../../../../core/components/layout/default_form.dart';
import '../../../../../core/utils/base_controller.dart';
import '../../domain/entites/client_entity.dart';
import 'list_client_controller.dart';

class ListClientPage extends GetWidget<ListClientController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: AppDrawer(),
      body: Stack(
        children: [
          AppBackground(),
          DefaultForm(
            layoutSize: LayoutSize.BIG_NO_PADDING_BUTTOM,
            children: [
              Spacer(
                flex: 041,
              ),
              TextFormField(
                onChanged: controller.filterChanged,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_rounded),
                  hintText: 'Pequisar cliente...',
                  hintStyle: Get.theme.textTheme.headline3,
                ),
              ),
              Spacer(
                flex: 035,
              ),
              Opacity(
                opacity: 0.5,
                child: Obx(() => Text(
                      '${controller.list.where(
                            (element) => element.show,
                          ).length} clientes encontrados',
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
                      onRefresh: controller.takeClients,
                      child: ListView.separated(
                        separatorBuilder: (_, __) => SizedBox(height: 0),
                        itemCount: controller.list.length,
                        itemBuilder: (context, index) {
                          return ClientItem(
                              clientEntity: controller.list[index],
                              controller: controller);
                        },
                      ),
                    )),
              )
            ],
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

class ClientItem extends StatelessWidget {
  final ClientEntity clientEntity;
  final ListClientController controller;

  const ClientItem({
    Key? key,
    required this.clientEntity,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: clientEntity.show,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: InkWell(
          onTap: () {
            controller.navigateToProduct(clientEntity);
          },
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Stack(
                children: [
                  background(constraints),
                  content(constraints, clientEntity),
                ],
              );
            },
          ),
        ),
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

  Padding content(BoxConstraints constraints, ClientEntity clientEntity) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            clientEntity.name,
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
                          clientEntity.qtde.toString(),
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
