import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/entites/product_entity.dart';
import 'package:t_truck_app/features/domain/use_cases/product/product_list_use_case.dart';
import 'package:t_truck_app/features/presentation/components/btn_devolution.dart';
import 'package:t_truck_app/features/presentation/pages/devolution/devolution_page.dart';
import 'package:t_truck_app/features/presentation/styles/app_dialog.dart';
import 'package:t_truck_app/features/presentation/utils/base_controller.dart';
import 'package:t_truck_app/injection_container.dart';

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

  void toDevolution(TypeDevolution typeDevolution) {
    if (typeDevolution == TypeDevolution.YELLOW) {
      productEntityList.value = productEntityList
          .map((e) => ProductEntity(
              codProd: e!.codProd,
              descricao: e.descricao,
              isCheck: false,
              qt: e.qt))
          .toList();
    }
    if (typeDevolution == TypeDevolution.RED) {
      productEntityList.value = productEntityList
          .map((e) => ProductEntity(
              codProd: e!.codProd,
              descricao: e.descricao,
              isCheck: true,
              qt: e.qt))
          .toList();
    }
    Get.to(
      () => DevolutionPage(),
      binding: DevolutionBiding(),
      arguments: [productEntityList, typeDevolution],
    );
  }
}
