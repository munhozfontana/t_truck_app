import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/entites/product_entity.dart';
import 'package:t_truck_app/features/domain/use_cases/product/product_list_use_case.dart';
import 'package:t_truck_app/features/presentation/styles/app_dialog.dart';
import 'package:t_truck_app/features/presentation/utils/base_controller.dart';

class DeliveryController extends GetxController with BaseController {
  final ProductListUseCase productListUseCase;

  DeliveryController({
    required this.productListUseCase,
  });

  Rx<OrderEntity?> orderEntity = Rx(Get.arguments);
  RxList<ProductEntity?> productEntityList = <ProductEntity>[].obs;

  @override
  void onInit() async {
    super.onInit();
    changeLoading(Loading.START);

    var params = Params(
      listIdentificacao: orderEntity.value!.identificacoes,
    );
    (await productListUseCase(params)).fold(
      (l) => AppDialog.error(
        menssagem: l.props.first.toString(),
      ),
      (r) => {
        productEntityList.value = r,
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    changeLoading(Loading.STOP);
  }
}
