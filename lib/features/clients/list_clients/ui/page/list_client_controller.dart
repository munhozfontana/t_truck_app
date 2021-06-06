import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/core/utils/app_dialog.dart';
import 'package:t_truck_app/features/clients/client_detail/client_detail_bading.dart';
import 'package:t_truck_app/features/clients/client_detail/ui/page/client_detail_page.dart';
import 'package:t_truck_app/features/clients/list_clients/domain/use_cases/clients_list_use_case.dart';

import '../../../../../core/utils/base_controller.dart';
import '../../domain/entites/client_entity.dart';

class ListClientController extends GetxController with BaseController {
  final ClientListUseCase clientsListUseCase;

  RxList<ClientEntity> list = <ClientEntity>[].obs;
  RxString filterInput = ''.obs;

  ListClientController({
    required this.clientsListUseCase,
  });

  @override
  void onReady() async {
    super.onReady();
    changeLoading(Loading.START);
    await takeClients();
    changeLoading(Loading.STOP);
  }

  Future takeClients() async {
    var res = await clientsListUseCase(Params());
    res.fold(
        (l) => {
              AppDialog.error(
                menssagem: l.props.first.toString(),
              ),
            },
        (r) async => {
              list.value = r,
            });
  }

  void filterChanged(String value) {
    list.value = list.map(
      (element) {
        if (value.isEmpty) {
          return element.copyWith(show: true);
        }

        return element.copyWith(
          show: element.name.isCaseInsensitiveContains(value),
        );
      },
    ).toList();
    list.refresh();
  }

  void navigateToProduct(ClientEntity client) {
    Get.to(
      () => ClientDetailPage(),
      binding: ClientDetailBiding(),
      arguments: client,
    );
  }
}
