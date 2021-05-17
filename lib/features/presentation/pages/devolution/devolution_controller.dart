import 'package:get/get.dart';
import 'package:t_truck_app/features/domain/entites/product_entity.dart';
import 'package:t_truck_app/features/presentation/pages/delivery/delivery_controller.dart';
import 'package:t_truck_app/features/presentation/utils/base_controller.dart';

class DevolutionController extends GetxController with BaseController {
  RxList<ProductEntity?> listProducts = <ProductEntity>[].obs;
  List<ProductEntity?> orginalList = <ProductEntity>[];

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
    orginalList = Get.find<DeliveryController>().productEntityList;
    listProducts.value = orginalList;
    listProducts.refresh();
    super.onInit();
  }
}
