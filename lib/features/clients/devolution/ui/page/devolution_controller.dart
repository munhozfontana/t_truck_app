import 'package:get/get.dart';
import 'package:t_truck_app/features/payment/ui/page/payment_controller.dart';

import '../../../../../core/components/btn_occurrence.dart';
import '../../../../../core/components/dropdown_default.dart';
import '../../../../../core/params/params.dart';
import '../../../../../core/utils/app_dialog.dart';
import '../../../../../core/utils/base_controller.dart';
import '../../../camera/take_picture/ui/page/camera_take_picture_page.dart';
import '../../../list_clients/data/models/client_model.dart';
import '../../domain/use_cases/devolution_list_use_case.dart';
import '../../domain/use_cases/devolution_save_usecase.dart';

class DevolutionController extends GetxController with BaseController {
  final DevolutionSaveUseCase devolutionSaveUseCase;
  final DevolutionListUseCase devolutionListUseCase;

  RxList<DropdownModel> reasonDevolution = <DropdownModel>[].obs;
  Rx<DropdownModel> selected = DropdownModel().obs;
  Rx<FromPayment> fromPayment = FromPayment.NONE.obs;

  Rx<TypeOccurrence> typeDevolution = TypeOccurrence.NONE.obs;
  Rx<ClientModel> clientModel = ClientModel().obs;

  DevolutionController({
    required this.devolutionSaveUseCase,
    required this.devolutionListUseCase,
  });

  @override
  void onInit() async {
    changeLoading(Loading.START);
    await loadDevolutionList();
    takeParameters();
    changeLoading(Loading.STOP);
    super.onInit();
  }

  Future<void> loadDevolutionList() async {
    (await devolutionListUseCase(Params())).fold(
      (l) => {
        AppDialog.error(menssagem: l.props.first.toString()),
      },
      (r) => {
        reasonDevolution.value = r,
      },
    );
  }

  void takeParameters() {
    typeDevolution.value = Get.arguments[0];
    clientModel.value = Get.arguments[1];
  }

  void finishReson() async {
    (await devolutionSaveUseCase(Params(
      selected: selected.value,
      clientModel: clientModel.value,
    )))
        .fold(
      (l) => AppDialog.error(menssagem: l.props.first.toString()),
      (r) => Get.to(() => TakePicturePage()),
    );
  }

  void changeDropdown(DropdownModel dropdownModel) {
    selected.value = dropdownModel;
  }
}
