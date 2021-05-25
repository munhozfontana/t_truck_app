import 'package:get/get.dart';
import 'package:t_truck_app/features/domain/entites/product_entity.dart';
import 'package:t_truck_app/features/presentation/components/btn_occurrence.dart';
import 'package:t_truck_app/features/presentation/pages/occurrence_reason/occurrence_reason_page.dart';
import 'package:t_truck_app/features/presentation/utils/base_controller.dart';
import 'package:t_truck_app/injection_container.dart';

class DevolutionController extends GetxController with BaseController {
  RxList<ProductEntity> listProducts = <ProductEntity>[].obs;
  Rx<TypeOccurrence> typeDevolution = TypeOccurrence.NONE.obs;

  RxString fieldFilterValue = ''.obs;

  void filterChanged(String value) {
    fieldFilterValue.value = value;
    fieldFilter(value);
    update();
  }

  void fieldFilter(String itemFilter) {
    listProducts.value = listProducts.map(
      (element) {
        var contains = element.descricao.isCaseInsensitiveContains(itemFilter);

        if (contains) {
          element.transacaoVendaEntity.hidden = false;
        } else {
          element.transacaoVendaEntity.hidden = true;
        }

        return element;
      },
    ).toList();
  }

  void updadeListFromValue(String value, ProductEntity productEntity) {
    if (!GetUtils.isNull(value)) {
      var existing = listProducts.indexWhere((p) =>
          p.transacaoVendaEntity.uuid ==
          productEntity.transacaoVendaEntity.uuid);

      if (!existing.isNegative) {
        listProducts[existing] = ProductEntity(
            codProd: productEntity.codProd,
            descricao: productEntity.descricao,
            qt: productEntity.qt,
            qtToSend: GetUtils.isBlank(value)! ? 0 : int.tryParse(value)!,
            transacaoVendaEntity: productEntity.transacaoVendaEntity);
        listProducts.refresh();
      }

      if (listProducts
          .where((element) => element.qtToSend < element.qt)
          .isEmpty) {
        typeDevolution.value = TypeOccurrence.RED;
      } else {
        typeDevolution.value = TypeOccurrence.YELLOW;
      }
    }
  }

  void nextPage() {
    if (typeDevolution.value == TypeOccurrence.YELLOW) {
      Get.to(() => OccurrenceReasonPage(),
          binding: OccurrenceReasonBiding(),
          arguments: [
            TypeOccurrence.YELLOW,
            listProducts,
          ]);
    } else {
      Get.to(() => OccurrenceReasonPage(),
          binding: OccurrenceReasonBiding(),
          arguments: [
            TypeOccurrence.RED,
          ]);
    }
  }

  @override
  void onInit() async {
    typeDevolution.value = Get.arguments[1];
    listProducts.value = Get.arguments[0];
    if (typeDevolution.value == TypeOccurrence.YELLOW) {
      listProducts.value = listProducts.map((element) {
        return ProductEntity(
          codProd: element.codProd,
          descricao: element.descricao,
          qt: element.qt,
          qtToSend: 0,
          transacaoVendaEntity: element.transacaoVendaEntity,
        );
      }).toList();
    } else {
      listProducts.value = listProducts.map((element) {
        return ProductEntity(
          codProd: element.codProd,
          descricao: element.descricao,
          qt: element.qt,
          qtToSend: element.qt,
          transacaoVendaEntity: element.transacaoVendaEntity,
        );
      }).toList();
    }

    listProducts.refresh();
    super.onInit();
  }
}
