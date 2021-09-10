import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/utils/styles_fonts.dart';

import '../../../../../core/components/app_background.dart';
import '../../../../../core/components/btn/btn_voltar.dart';
import '../../../../../core/components/btn_occurrence.dart';
import '../../../../../core/components/layout/default_form.dart';
import '../../../client_detail/ui/page/client_detail_page.dart';
import '../../data/models/product_model.dart';
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
                  Obx(() {
                    return Visibility(
                      visible: !controller.blockField.value,
                      replacement: Center(
                        child: Text(
                          controller
                              .clientModel.value.produtos.first.numTransVenda
                              .toString(),
                          style: StylesTypography.h18wBold,
                        ),
                      ),
                      child: TextFormField(
                        readOnly: controller.blockField.value,
                        onChanged: controller.filterNumTransvendaChanged,
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
                          hintText: 'Número Trans Venda...',
                        ),
                      ),
                    );
                  }),
                  Spacer(
                    flex: 6,
                  ),
                  Obx(() {
                    return Visibility(
                      visible: !controller.blockField.value,
                      child: TextFormField(
                        readOnly: controller.blockField.value,
                        onChanged: controller.filterNameChanged,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Color(0xff090e32).withOpacity(0.4),
                          ),
                          hintStyle: TextStyle(
                              color: Color(0xff000000).withOpacity(0.4),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.italic,
                              fontSize: 16.0),
                          hintText: 'Nome do produto...',
                        ),
                      ),
                    );
                  }),
                  Spacer(
                    flex: 6,
                  ),
                  GetX<ListProductsController>(
                    builder: (_) {
                      return Opacity(
                        opacity: 0.5,
                        child: Text(
                          '${_.clientModel.value.produtos.where((e) => e.show).length} Produtos encontrados',
                          style: Get.textTheme.headline6,
                          textAlign: TextAlign.left,
                        ),
                      );
                    },
                  ),
                  Spacer(
                    flex: 6,
                  ),
                  GetX<ListProductsController>(
                    builder: (_) {
                      return Container(
                        height: constraints.maxHeight *
                            (controller.blockField.value ? .75 : .60),
                        child: ListView.separated(
                          separatorBuilder: (a, b) => SizedBox(height: 0),
                          itemCount: _.clientModel.value.produtos.length + 1,
                          itemBuilder: (context, index) {
                            if (index == _.clientModel.value.produtos.length) {
                              return renderLastItem();
                            }
                            return comumItem(
                                _.clientModel.value.produtos[index]);
                          },
                        ),
                      );
                    },
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget comumItem(ProductModel? productEntity) {
    return Visibility(
      visible: productEntity!.show,
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
                      child: Text(
                          '${productEntity.numTransVenda} - ${productEntity.name}'),
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
                          int.parse(value) > productEntity.maxQuantity) {
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
                onTap: controller.clientModel.value.produtos
                        .where((item) => item.quantity > 0)
                        .isNotEmpty
                    ? controller.nextPage
                    : null,
                label: controller.typeDevolution.value == TypeOccurrence.YELLOW
                    ? 'Devolução parcial'
                    : 'Devolução total',
                typeOccurrence: controller.typeDevolution.value,
              );
            },
          ),
          Spacer(
            flex: 035,
          ),
          BtnVoltar(
            label: 'Voltar',
            onTap: () => Get.off(() => ClientDetailPage()),
          ),
          Spacer(
            flex: 035,
          ),
        ],
      ),
    );
  }
}
