import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/data/repository/order_repository.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/use_cases/order/order_list_use_case.dart';
import 'package:t_truck_app/features/presentation/pages/login/login_page.dart';
import 'package:t_truck_app/features/presentation/pages/order/order_page.dart';
import 'package:t_truck_app/features/presentation/pages/product/product_page.dart';
import 'package:t_truck_app/features/presentation/styles/app_dialog.dart';
import 'package:t_truck_app/features/presentation/utils/base_controller.dart';
import 'package:t_truck_app/injection_container.dart';

class OrderController extends GetxController with BaseController {
  final OrderListUseCase orderListUseCase;
  final ILoggedUser iLoggedUser;
  RxList<OrderEntity> list = <OrderEntity>[].obs;
  RxList<OrderEntity> filtredList = <OrderEntity>[].obs;

  RxString filterInput = ''.obs;

  Rx<OrderEntity?> orderEntity = OrderEntity(
    cliente: '',
    codCli: 0,
    identificacoes: [],
    numCar: 0,
    dtSaida: '',
  ).obs;

  OrderController({
    required this.orderListUseCase,
    required this.iLoggedUser,
  });

  @override
  void onReady() async {
    super.onReady();
    changeLoading(Loading.START);
    await takeOrders();
  }

  Future takeOrders() async {
    var res = await orderListUseCase(Params());
    res.fold(
        (l) => {
              changeLoading(Loading.STOP),
              AppDialog.error(
                menssagem: l.props.first.toString(),
              ),
            },
        (r) async => {
              changeLoading(Loading.STOP),
              list.value = r,
              filtredList.value = r,
            });
  }

  void filterChanged(String value) {
    filtredList.value = filterList(list, value);
  }

  List<OrderEntity> filterList(List<OrderEntity> list, String itemFilter) {
    return list
        .where(
            (element) => element.cliente.isCaseInsensitiveContains(itemFilter))
        .toList();
  }

  void navigateToProduct(OrderEntity order) {
    orderEntity.value = order;
    Get.to(
      () => ProductPage(),
      binding: DeliveryBiding(),
    );
  }

  void logout() {
    if (Get.currentRoute.contains('OrderPage')) {
      iLoggedUser.logout();
      Get.offAll(() => LoginPage(), binding: LoginBiding());
    } else {
      Get.offAll(() => OrderPage(), binding: OrderBiding());
    }
  }
}
