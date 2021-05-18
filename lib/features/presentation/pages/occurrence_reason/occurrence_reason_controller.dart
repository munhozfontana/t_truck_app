import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/use_cases/occurrence/occurrence_list_use_case.dart';
import 'package:t_truck_app/features/presentation/components/btn_occurrence.dart';
import 'package:t_truck_app/features/presentation/components/dropdown_default.dart';
import 'package:t_truck_app/features/presentation/pages/devolution/devolution_finish/devolution_finish.dart';
import 'package:t_truck_app/features/presentation/pages/devolution/devolution_page.dart';
import 'package:t_truck_app/features/presentation/pages/payment/payment_page.dart';
import 'package:t_truck_app/features/presentation/styles/app_dialog.dart';
import 'package:t_truck_app/features/presentation/utils/base_controller.dart';

class OccurrenceReasonController extends GetxController with BaseController {
  final OccurrenceListUseCase occurrenceListUseCase;

  RxList<DropdownModel> reasonDevolution = <DropdownModel>[].obs;

  OccurrenceReasonController({
    required this.occurrenceListUseCase,
  });

  @override
  void onInit() async {
    changeLoading(Loading.START);
    (await occurrenceListUseCase(Params())).fold(
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
    if (Get.parameters[0] == TypeOccurrence.YELLOW) {
      // TODO: Subtrair items
      Get.to(() => PaymentPage());
    } else {
      Get.to(() => DevolutionFinish());
    }
  }
}
