import 'dart:async';

import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/entites/product_entity.dart';
import 'package:t_truck_app/features/domain/use_cases/product/product_list_use_case.dart';
import 'package:t_truck_app/features/presentation/components/btn_occurrence.dart';
import 'package:t_truck_app/features/presentation/pages/devolution/devolution_page.dart';
import 'package:t_truck_app/features/presentation/pages/order/order_controller.dart';
import 'package:t_truck_app/features/presentation/styles/app_dialog.dart';
import 'package:t_truck_app/features/presentation/utils/base_controller.dart';
import 'package:t_truck_app/injection_container.dart';

class ProductController extends GetxController with BaseController {
  final ProductListUseCase productListUseCase;

  ProductController({
    required this.productListUseCase,
  });

  Rx<OrderEntity?> orderEntity = Get.find<OrderController>().orderEntity;
  RxList<ProductEntity?> productEntityList = <ProductEntity>[].obs;
  RxString qtdProdutos = ''.obs;
  RxString qtdNotas = ''.obs;

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
        qtdProdutos.value = productEntityList.length.toString(),
        qtdNotas.value = orderEntity.value!.identificacoes.length.toString(),
        qtdProdutos.refresh(),
        qtdNotas.refresh(),
        Timer(Duration(seconds: 1), () {
          changeLoading(Loading.STOP);
        })
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  void toDevolution(TypeOccurrence typeDevolution) {
    if (typeDevolution == TypeOccurrence.YELLOW) {
      productEntityList.value = productEntityList
          .map((e) => ProductEntity(
                codProd: e!.codProd,
                descricao: e.descricao,
                qt: e.qt,
                qtToSend: 0,
                transacaoVendaEntity: e.transacaoVendaEntity,
              ))
          .toList();
    }
    if (typeDevolution == TypeOccurrence.RED) {
      productEntityList.value = productEntityList
          .map((e) => ProductEntity(
                codProd: e!.codProd,
                descricao: e.descricao,
                qt: e.qt,
                qtToSend: e.qt,
                transacaoVendaEntity: e.transacaoVendaEntity,
              ))
          .toList();
    }
    Get.to(
      () => DevolutionPage(),
      binding: DevolutionBiding(),
      arguments: [productEntityList, typeDevolution],
    );
  }
}
