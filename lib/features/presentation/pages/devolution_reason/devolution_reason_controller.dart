import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/use_cases/devolution/devolution_list_use_case.dart';
import 'package:t_truck_app/features/presentation/components/dropdown_default.dart';
import 'package:t_truck_app/features/presentation/pages/devolution/devolution_page.dart';
import 'package:t_truck_app/features/presentation/styles/app_dialog.dart';
import 'package:t_truck_app/features/presentation/utils/base_controller.dart';

class DevolutionReasonController extends GetxController with BaseController {
  final DevolutionListUseCase devolutionListUseCase;

  RxList<DropdownModel> reasonDevolution = <DropdownModel>[].obs;

  DevolutionReasonController({
    required this.devolutionListUseCase,
  });

  @override
  void onInit() async {
    changeLoading(Loading.START);
    (await devolutionListUseCase(Params())).fold(
      (l) => AppDialog.error(menssagem: 'error'),
      (r) => {
        reasonDevolution.value = r
            .map(
              (element) => DropdownModel(
                id: element.codProduto,
                label: element.descricao,
              ),
            )
            .toList(),
        changeLoading(Loading.STOP)
      },
    );
    super.onInit();
  }

  void back() {
    Get.off(() => DevolutionPage());
  }

  void finishReson() {
    // if (deliveryController.devolutionState == TypeDevolution.YELLOW) {
    //   Get.to(() => PaymentPage());
    // } else {
    //   Get.to(() => DevolutionFinish());
    // }
  }
}
