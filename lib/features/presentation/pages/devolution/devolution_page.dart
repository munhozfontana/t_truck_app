import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/domain/entites/product_entity.dart';
import 'package:t_truck_app/features/presentation/components/app_background.dart';
import 'package:t_truck_app/features/presentation/components/btn_occurrence.dart';
import 'package:t_truck_app/features/presentation/components/layout/layout_form.dart';
import 'package:t_truck_app/features/presentation/pages/devolution/devolution_controller.dart';
import 'package:t_truck_app/features/presentation/pages/occurrence_reason/occurrence_reason_page.dart';
import 'package:t_truck_app/features/presentation/pages/product/product_page.dart';
import 'package:t_truck_app/injection_container.dart';

class DevolutionPage extends GetWidget<DevolutionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          AppBackground(),
          LayoutForm(
            child: LayoutBuilder(
              builder: (BuildContext _, BoxConstraints constraints) {
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
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: Color(0xff090e32).withOpacity(0.4),
                        ),
                        suffixIcon: Icon(
                          Icons.photo_camera_outlined,
                          color: Color(0xff090e32).withOpacity(0.4),
                        ),
                        hintStyle: TextStyle(
                            color: Color(0xff000000).withOpacity(0.4),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.italic,
                            fontSize: 16.0),
                        hintText: 'Pesquisar produto...',
                      ),
                    ),
                    Spacer(
                      flex: 035,
                    ),
                    GetX<DevolutionController>(
                      builder: (_) {
                        return Opacity(
                          opacity: 0.5,
                          child: Text(
                            '${_.fieldFilter(_.listProducts, _.fieldFilterValue.value).length} Produtos encontrados',
                            style: Get.textTheme.headline6,
                            textAlign: TextAlign.left,
                          ),
                        );
                      },
                    ),
                    Spacer(
                      flex: 035,
                    ),
                    Container(
                      height: constraints.maxHeight * .75,
                      child: GetX<DevolutionController>(
                        builder: (_) {
                          return ListView.separated(
                            separatorBuilder: (a, b) => SizedBox(height: 14),
                            itemCount: _
                                    .fieldFilter(_.listProducts,
                                        _.fieldFilterValue.value)
                                    .length +
                                1,
                            itemBuilder: (context, index) {
                              if (index ==
                                  _
                                      .fieldFilter(_.listProducts,
                                          _.fieldFilterValue.value)
                                      .length) {
                                return renderLastItem();
                              }
                              return comumItem(_.fieldFilter(_.listProducts,
                                  _.fieldFilterValue.value)[index]);
                            },
                          );
                        },
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  LayoutBuilder comumItem(ProductEntity? productEntity) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 7,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(productEntity!.descricao),
                ),
              ),
            ),
            Spacer(),
            Flexible(
              flex: 2,
              child: TextFormField(
                onChanged: (value) {
                  controller.updadeListFromValue(value, productEntity);
                },
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.always,
                initialValue: productEntity.qtToSend == 0
                    ? ''
                    : productEntity.qtToSend.toString(),
                maxLength: productEntity.qt.toString().length,
                validator: (value) {
                  if (value!.isNotEmpty &&
                      int.parse(value) >
                          controller.getByCod(productEntity).qt) {
                    return '${controller.getByCod(productEntity).qt}';
                  }
                },
                decoration: InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Container renderLastItem() {
    return Container(
      height: 200,
      child: Column(
        children: [
          Divider(),
          Spacer(
            flex: 035,
          ),
          GetX<DevolutionController>(
            builder: (_) {
              if (controller.typeDevolution.value == TypeOccurrence.YELLOW) {
                return BtnOccurrence(
                  onTap: () {
                    Get.to(() => OccurrenceReasonPage(),
                        binding: OccurrenceReasonBiding(),
                        arguments: [
                          TypeOccurrence.YELLOW,
                          controller.listProducts
                        ]);
                  },
                  label: 'Devolução parcial',
                  typeOccurrence: TypeOccurrence.YELLOW,
                );
              } else {
                return BtnOccurrence(
                  onTap: () {
                    Get.to(() => OccurrenceReasonPage(),
                        binding: OccurrenceReasonBiding(),
                        arguments: [
                          TypeOccurrence.RED,
                        ]);
                  },
                  label: 'Devolução total',
                  typeOccurrence: TypeOccurrence.RED,
                );
              }
            },
          ),
          Spacer(
            flex: 035,
          ),
          GestureDetector(
            onTap: () =>
                Get.off(() => ProductPage(), binding: DeliveryBiding()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.keyboard_arrow_left_rounded),
                Text('Voltar',
                    style: const TextStyle(
                        color: Color(0xff6c6c6c),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left)
              ],
            ),
          ),
          Spacer(
            flex: 035,
          ),
        ],
      ),
    );
  }
}
