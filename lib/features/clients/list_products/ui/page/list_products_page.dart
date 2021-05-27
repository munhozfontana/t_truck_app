import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../core/components/app_background.dart';
import '../../../../../core/components/btn/btn_voltar.dart';
import '../../../../../core/components/btn_occurrence.dart';
import '../../../../../core/components/layout/default_form.dart';
import '../../../../../injection_container.dart';
import '../../domain/entites/product_entity.dart';
import 'list_products_controller.dart';

class ListProductsPage extends GetWidget<ListProductsController> {
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
                  GetX<ListProductsController>(
                    builder: (_) {
                      return Opacity(
                        opacity: 0.5,
                        child: Text(
                          '${_.listProducts.where((e) => !e.hidden).length} Produtos encontrados',
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
                    child: GetX<ListProductsController>(
                      builder: (_) {
                        return ListView.separated(
                          separatorBuilder: (a, b) => SizedBox(height: 0),
                          itemCount: _.listProducts.length + 1,
                          itemBuilder: (context, index) {
                            if (index == _.listProducts.length) {
                              return renderLastItem();
                            }
                            return comumItem(_.listProducts[index]);
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

  Widget comumItem(ProductEntity? productEntity) {
    return Visibility(
      visible: !productEntity!.hidden,
      maintainState: true,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            margin: EdgeInsets.only(bottom: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 10,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(productEntity.name!),
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
                    initialValue: productEntity.quantity.toString(),
                    maxLength: productEntity.maxQuantity.toString().length,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Min 0';
                      }
                      if (value.isNotEmpty &&
                          int.parse(value) > productEntity.maxQuantity!) {
                        return 'Max ${productEntity.maxQuantity}';
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
            ),
          );
        },
      ),
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
          GetX<ListProductsController>(
            builder: (_) {
              return BtnOccurrence(
                onTap: controller.listProducts
                        .where((item) => item.quantity! > 0)
                        .isNotEmpty
                    ? controller.nextPage
                    : null,
                label:
                    controller.typeListProducts.value == TypeOccurrence.YELLOW
                        ? 'Devolução parcial'
                        : 'Devolução total',
                typeOccurrence: controller.typeListProducts.value,
              );
            },
          ),
          Spacer(
            flex: 035,
          ),
          BtnVoltar(
            label: 'Voltar',
            onTap: () => Get.offAll(
              ListProductsPage(),
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
