import 'package:get/get.dart';
import 'package:t_truck_app/features/clients/list_clients/domain/use_cases/clients_list_use_case.dart';

import '../../../../../core/adapters/protocols/i_logged_user.dart';
import '../../../../../core/utils/base_controller.dart';
import '../../domain/entites/client_entity.dart';

class ListClientController extends GetxController with BaseController {
  final ClientListUseCase clientsListUseCase;
  final ILoggedUser iLoggedUser;

  RxList<ClientEntity> list = <ClientEntity>[].obs;
  RxList<ClientEntity> filtredList = <ClientEntity>[].obs;

  RxString filterInput = ''.obs;

  Rx<ClientEntity?> clientEntity = ClientEntity().obs;

  ListClientController({
    required this.clientsListUseCase,
    required this.iLoggedUser,
  });

  @override
  void onReady() async {
    super.onReady();
    changeLoading(Loading.START);
    await takeClients();
  }

  Future takeClients() async {
    // var res = await clientsListUseCase(Params());
    // res.fold(
    //     (l) => {
    //           changeLoading(Loading.STOP),
    //           AppDialog.error(
    //             menssagem: l.props.first.toString(),
    //           ),
    //         },
    //     (r) async => {
    //           changeLoading(Loading.STOP),
    //           list.value = r,
    //           filtredList.value = r,
    //         });
  }

  void filterChanged(String value) {
    filtredList.value = filterList(list, value);
  }

  List<ClientEntity> filterList(List<ClientEntity> list, String itemFilter) {
    return list
        .where((element) => element.name!.isCaseInsensitiveContains(itemFilter))
        .toList();
  }

  void navigateToProduct(ClientEntity client) {
    // clientEntity.value = client;
    // Get.to(
    //   () => ProductPage(),
    //   binding: DeliveryBiding(),
    // );
  }

  void logout() async {
    // if (Get.currentRoute.contains('ClientPage')) {
    //   await iLoggedUser.logout();
    //   resetAll();
    //   await Get.offAll(() => LoginPage(), binding: LoginBiding());
    // } else {
    //   await Get.offAll(() => ClientPage(), binding: ClientBiding());
    // }
  }

  void resetAll() {
    list.clear();
    filtredList.clear();
    filterInput = ''.obs;
  }
}
