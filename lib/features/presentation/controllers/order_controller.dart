import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/use_cases/order/order_list_use_case.dart';
import 'package:t_truck_app/features/presentation/controllers/base_controller.dart';
import 'package:t_truck_app/features/presentation/styles/app_snackbar.dart';

class OrderController extends GetxController with BaseController {
  final OrderListUseCase orderListUseCase;
  RxList<OrderEntity> list = <OrderEntity>[].obs;
  RxList<OrderEntity> filtredList = <OrderEntity>[].obs;

  RxString filterInput = ''.obs;

  OrderController({required this.orderListUseCase});

  @override
  void onReady() async {
    super.onReady();
    changeLoading(Loading.START);
    var res = await orderListUseCase(Params());
    changeLoading(Loading.STOP);
    res.fold(
        (l) => {
              AppDialog.error(
                menssagem: l.props.first.toString(),
              ),
            },
        (r) async => {
              list.value = r,
              filtredList.value = r,
            });
  }

  void filterChanged(String value) {
    filtredList.value = list
        .where(
            (element) => element.codCliCliente.isCaseInsensitiveContains(value))
        .toList();
    filterInput.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    print('onInit()');
  }
}
