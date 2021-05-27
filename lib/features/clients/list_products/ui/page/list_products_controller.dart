import 'package:get/get.dart';

import '../../../../../core/components/btn_occurrence.dart';
import '../../../../../core/utils/base_controller.dart';
import '../../domain/entites/product_entity.dart';

class ListProductsController extends GetxController with BaseController {
  RxList<ProductEntity> listProducts = <ProductEntity>[].obs;
  Rx<TypeOccurrence> typeListProducts = TypeOccurrence.NONE.obs;

  RxString fieldFilterValue = ''.obs;

  void filterChanged(String value) {
    fieldFilterValue.value = value;
    fieldFilter(value);
    update();
  }

  void fieldFilter(String itemFilter) {
    listProducts.value = listProducts.map(
      (element) {
        var contains = element.name!.isCaseInsensitiveContains(itemFilter);

        if (contains) {
          element.hidden = false;
        } else {
          element.hidden = true;
        }

        return element;
      },
    ).toList();
  }

  void updadeListFromValue(String value, ProductEntity productEntity) {
    // if (!GetUtils.isNull(value)) {
    //   var existing = listProducts.indexWhere((p) =>
    //       p.transacaoVendaEntity.uuid ==
    //       productEntity.transacaoVendaEntity.uuid);

    //   if (!existing.isNegative) {
    //     listProducts[existing] = ProductEntity(
    //         codProd: productEntity.codProd,
    //         descricao: productEntity.descricao,
    //         qt: productEntity.qt,
    //         qtToSend: GetUtils.isBlank(value)! ? 0 : int.tryParse(value)!,
    //         transacaoVendaEntity: productEntity.transacaoVendaEntity);
    //     listProducts.refresh();
    //   }

    //   if (listProducts
    //       .where((element) => element.qtToSend < element.qt)
    //       .isEmpty) {
    //     typeListProducts.value = TypeOccurrence.RED;
    //   } else {
    //     typeListProducts.value = TypeOccurrence.YELLOW;
    //   }
    // }
  }

  void nextPage() {
    // if (typeListProducts.value == TypeOccurrence.YELLOW) {
    //   Get.to(() => OccurrenceReasonPage(),
    //       binding: OccurrenceReasonBiding(),
    //       arguments: [
    //         TypeOccurrence.YELLOW,
    //         listProducts,
    //       ]);
    // } else {
    //   Get.to(() => OccurrenceReasonPage(),
    //       binding: OccurrenceReasonBiding(),
    //       arguments: [
    //         TypeOccurrence.RED,
    //       ]);
    // }
  }

  @override
  void onInit() async {
    // typeListProducts.value = Get.arguments[1];
    // listProducts.value = Get.arguments[0];
    // if (typeListProducts.value == TypeOccurrence.YELLOW) {
    //   listProducts.value = listProducts.map((element) {
    //     return ProductEntity(
    //       codProd: element.codProd,
    //       descricao: element.descricao,
    //       qt: element.qt,
    //       qtToSend: 0,
    //       transacaoVendaEntity: element.transacaoVendaEntity,
    //     );
    //   }).toList();
    // } else {
    //   listProducts.value = listProducts.map((element) {
    //     return ProductEntity(
    //       codProd: element.codProd,
    //       descricao: element.descricao,
    //       qt: element.qt,
    //       qtToSend: element.qt,
    //       transacaoVendaEntity: element.transacaoVendaEntity,
    //     );
    //   }).toList();
    // }

    // listProducts.refresh();

    super.onInit();
  }
}
