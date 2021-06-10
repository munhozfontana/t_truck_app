import 'package:get/get.dart';
import 'package:t_truck_app/core/components/btn_occurrence.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/clients/client_detail/domain/use_cases/client_detail_list_use_case.dart';
import 'package:t_truck_app/features/clients/list_products/list_products_biding.dart';
import 'package:t_truck_app/features/clients/list_products/ui/page/list_products_page.dart';

import '../../../../../core/utils/base_controller.dart';
import '../../../list_clients/data/models/client_model.dart';

class ClientDetailController extends GetxController with BaseController {
  ProductListUseCase productListUseCase;

  ClientDetailController({
    required this.productListUseCase,
  });

  Rx<ClientModel?> clientEntity = ClientModel().obs;

  @override
  void onInit() async {
    changeLoading(Loading.START);
    ClientModel clientModelParam = Get.arguments;
    (await productListUseCase(Params(codCli: clientModelParam.codCli))).fold(
      (l) => null,
      (r) => clientEntity = ClientModel(
        name: clientModelParam.name,
        qtde: clientModelParam.qtde,
        codCli: clientModelParam.codCli,
        produtos: r,
      ).obs,
    );
    changeLoading(Loading.STOP);
    super.onInit();
  }

  void toListProducts(TypeOccurrence typeOccurrence) {
    Get.to(
      () => ListProductsPage(),
      binding: LitProductsBiding(),
      arguments: [typeOccurrence, clientEntity],
    );
  }
}
