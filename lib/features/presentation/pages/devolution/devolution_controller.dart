import 'package:get/get.dart';
import 'package:t_truck_app/features/domain/entites/product_entity.dart';
import 'package:t_truck_app/features/presentation/components/btn_occurrence.dart';
import 'package:t_truck_app/features/presentation/utils/base_controller.dart';

class DevolutionController extends GetxController with BaseController {
  RxList<ProductEntity?> listProducts = <ProductEntity>[].obs;
  List<ProductEntity?> orginalList = <ProductEntity>[];
  Rx<TypeOccurrence> typeDevolution = TypeOccurrence.NONE.obs;

  RxString fieldFilterValue = ''.obs;

  void filterChanged(String value) {
    fieldFilterValue.value = value;
    update();
  }

  List<ProductEntity?> fieldFilter(
      List<ProductEntity?> list, String itemFilter) {
    return list.where(
      (element) {
        return element!.descricao.isCaseInsensitiveContains(itemFilter);
      },
    ).toList();
  }

  @override
  void onInit() async {
    orginalList = Get.arguments[0];
    typeDevolution.value = Get.arguments[1];
    listProducts.value = orginalList;
    if (typeDevolution.value == TypeOccurrence.YELLOW) {
      listProducts.value = listProducts.map((element) {
        return ProductEntity(
            codProd: element!.codProd,
            descricao: element.descricao,
            qt: element.qt,
            qtToSend: 0);
      }).toList();
    } else {
      listProducts.value = listProducts.map((element) {
        return ProductEntity(
            codProd: element!.codProd,
            descricao: element.descricao,
            qt: element.qt,
            qtToSend: element.qt);
      }).toList();
    }

    listProducts.refresh();
    super.onInit();
  }

  ProductEntity getByCod(ProductEntity productEntity) {
    return orginalList
        .firstWhere((element) => element!.codProd == productEntity.codProd)!;
  }

  void updadeListFromValue(String value, ProductEntity productEntity) {
    if (!GetUtils.isNullOrBlank(value)!) {
      var existing =
          listProducts.indexWhere((p) => p!.codProd == productEntity.codProd);

      if (!existing.isNegative) {
        listProducts[existing] = ProductEntity(
          codProd: productEntity.codProd,
          descricao: productEntity.descricao,
          qt: productEntity.qt,
          qtToSend: int.tryParse(value) ?? 0,
        );
        listProducts.refresh();
      }

      if (listProducts
          .where((element) => element!.qtToSend < element.qt)
          .isEmpty) {
        typeDevolution.value = TypeOccurrence.RED;
      } else {
        typeDevolution.value = TypeOccurrence.YELLOW;
      }
    }
  }
}
