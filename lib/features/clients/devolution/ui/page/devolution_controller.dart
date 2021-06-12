import 'package:get/get.dart';

import '../../../../../core/components/btn_occurrence.dart';
import '../../../../../core/components/dropdown_default.dart';
import '../../../../../core/params/params.dart';
import '../../../../../core/utils/app_dialog.dart';
import '../../../../../core/utils/base_controller.dart';
import '../../domain/use_cases/devolution_list_use_case.dart';
import '../../domain/use_cases/devolution_save_usecase.dart';

class DevolutionController extends GetxController with BaseController {
  final DevolutionSaveUseCase devolutionSaveUseCase;
  final DevolutionListUseCase devolutionListUseCase;
  RxList<DropdownModel> reasonDevolution = <DropdownModel>[].obs;
  Rx<DropdownModel> selected = DropdownModel(id: 0, label: '').obs;
  Rx<TypeOccurrence> typeDevolution = TypeOccurrence.NONE.obs;

  var changeDropdown;

  DevolutionController({
    required this.devolutionSaveUseCase,
    required this.devolutionListUseCase,
  });

  @override
  void onInit() async {
    changeLoading(Loading.START);
    (await devolutionListUseCase(Params())).fold(
      (l) => AppDialog.error(menssagem: 'error'),
      (r) => {reasonDevolution.value = r, changeLoading(Loading.STOP)},
    );

    super.onInit();
  }

  void finishReson() async {}
}
