import 'package:get/get.dart';
import 'package:t_truck_app/features/domain/entites/product_entity.dart';
import 'package:t_truck_app/features/presentation/components/btn_devolution.dart';
import 'package:t_truck_app/features/presentation/utils/base_controller.dart';

class DevolutionController extends GetxController with BaseController {
  RxList<ProductEntity?> listProducts = <ProductEntity>[].obs;
  List<ProductEntity?> orginalList = <ProductEntity>[];
  Rx<TypeDevolution> typeDevolution = TypeDevolution.NONE.obs;

  RxString fieldFilterValue = ''.obs;

  void filterChanged(String value) {
    listProducts.value = fieldFilter(
      orginalList,
      value,
    );
  }

  List<ProductEntity?> fieldFilter(
      List<ProductEntity?> list, String itemFilter) {
    return list.where(
      (element) {
        return element!.descricao.isCaseInsensitiveContains(itemFilter);
      },
    ).toList();
  }

  void changeStatus(ProductEntity? productEntityList, int index) {}

  @override
  void onInit() async {
    orginalList = Get.arguments[0];
    typeDevolution.value = Get.arguments[1];
    listProducts.value = orginalList;

    if (typeDevolution.value == TypeDevolution.YELLOW) {
      listProducts.value = listProducts.map((element) {
        return ProductEntity(
            codProd: element!.codProd,
            descricao: element.descricao,
            isCheck: element.isCheck,
            qt: 0);
      }).toList();
    }

    listProducts.refresh();
    super.onInit();
  }
}
