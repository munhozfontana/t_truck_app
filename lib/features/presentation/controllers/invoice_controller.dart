import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/use_cases/invoice/invoice_list_use_case.dart';
import 'package:t_truck_app/features/presentation/controllers/base_controller.dart';

class InvoiceController extends GetxController {
  final InvoiceListUseCase invoiceListUseCase;
  RxList list = [].obs;

  InvoiceController({required this.invoiceListUseCase});

  final loadingState = Loading.STOP.obs;
  void changeLoading(Loading loading) {
    loadingState.value = loading;
  }

  @override
  void onReady() async {
    super.onReady();
    changeLoading(Loading.START);
    var res = await invoiceListUseCase(Params());
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
    print("onInit()");
  }
}
