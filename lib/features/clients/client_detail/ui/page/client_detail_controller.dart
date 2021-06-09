import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/clients/client_detail/domain/use_cases/client_detail_list_use_case.dart';

import '../../../../../core/utils/base_controller.dart';
import '../../../list_clients/data/models/client_model.dart';

class ClientDetailController extends GetxController with BaseController {
  ProductListUseCase productListUseCase;

  ClientDetailController({
    required this.productListUseCase,
  });

  Rx<ClientModel?> clientEntity = ClientModel(
    produtosModel: [],
    cliente: '',
    qtde: 0,
    codCli: 0,
  ).obs;

  @override
  void onInit() async {
    changeLoading(Loading.START);
    ClientModel clientModelParam = Get.arguments;
    (await productListUseCase(Params(codCli: clientModelParam.codCli))).fold(
      (l) => null,
      (r) => clientEntity = ClientModel(
        cliente: clientModelParam.cliente,
        qtde: clientModelParam.qtde,
        codCli: clientModelParam.codCli!,
        produtosModel: r,
      ).obs,
    );
    changeLoading(Loading.STOP);
    super.onInit();
  }
}
