import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/domain/entites/product_entity.dart';
import 'package:t_truck_app/features/presentation/components/app_background.dart';
import 'package:t_truck_app/features/presentation/components/btn/btn_voltar.dart';
import 'package:t_truck_app/features/presentation/components/btn_occurrence.dart';
import 'package:t_truck_app/features/presentation/components/layout/default_form.dart';
import 'package:t_truck_app/features/presentation/pages/devolution/devolution_controller.dart';
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
          DefaultForm(
            layoutSize: LayoutSize.BIG_NO_PADDING_BUTTOM,
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    height: constraints.maxHeight * .65,
                    child: GetX<DevolutionController>(
                      builder: (_) {
                        return ListView.separated(
                          separatorBuilder: (a, b) => SizedBox(height: 14),
                          itemCount: _
                                  .fieldFilter(
                                      _.listProducts, _.fieldFilterValue.value)
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
              flex: 10,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(productEntity!.descricao),
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Flexible(
              flex: 2,
              child: TextFormField(
                onChanged: (value) {
                  controller.updadeListFromValue(value, productEntity);
                },
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.always,
                initialValue: productEntity.qtToSend.toString(),
                maxLength: productEntity.qt.toString().length,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Min 0';
                  }
                  if (value.isNotEmpty &&
                      int.parse(value) >
                          controller.getByCod(productEntity).qt) {
                    return 'Max ${controller.getByCod(productEntity).qt}';
                  }
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  counterText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(0),
                    ),
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
              return BtnOccurrence(
                onTap: controller.listProducts
                        .where((item) => item.qtToSend > 0)
                        .isNotEmpty
                    ? controller.nextPage
                    : null,
                label: controller.typeDevolution.value == TypeOccurrence.YELLOW
                    ? 'Devolu????o parcial'
                    : 'Devolu????o total',
                typeOccurrence: controller.typeDevolution.value,
              );
            },
          ),
          Spacer(
            flex: 035,
          ),
          BtnVoltar(
            label: 'Voltar',
            onTap: () => Get.offAll(
              ProductPage(),
              binding: DeliveryBiding(),
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
