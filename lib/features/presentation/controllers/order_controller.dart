import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/use_cases/order/order_list_use_case.dart';
import 'package:t_truck_app/features/presentation/controllers/base_controller.dart';

class OrderController extends GetxController {
  final OrderListUseCase orderListUseCase;
  RxList list = [].obs;

  OrderController({required this.orderListUseCase});

  final loadingState = Loading.STOP.obs;
  void changeLoading(Loading loading) {
    loadingState.value = loading;
  }

  @override
  void onReady() async {
    super.onReady();
    changeLoading(Loading.START);
    var res = await orderListUseCase(Params());
    changeLoading(Loading.STOP);
    res.fold(
        (l) => {
              Get.snackbar(
                'Titulo',
                l.props.first.toString(),
                colorText: Colors.blueAccent,
                snackPosition: SnackPosition.BOTTOM,
              ),
            },
        (r) async => list.value = r);
  }

  @override
  void onInit() {
    super.onInit();
    print('onInit()');
  }
}
