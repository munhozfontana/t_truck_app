import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/domain/use_cases/devolution/devolution_save_usecase.dart';
import 'package:t_truck_app/features/domain/use_cases/occurrence/occurrence_list_use_case.dart';
import 'package:t_truck_app/features/presentation/components/btn_occurrence.dart';
import 'package:t_truck_app/features/presentation/components/dropdown_default.dart';
import 'package:t_truck_app/features/presentation/pages/devolution/devolution_controller.dart';
import 'package:t_truck_app/features/presentation/pages/devolution/devolution_finish/devolution_finish.dart';
import 'package:t_truck_app/features/presentation/pages/payment/payment_page.dart';
import 'package:t_truck_app/features/presentation/pages/product/product_controller.dart';
import 'package:t_truck_app/features/presentation/styles/app_dialog.dart';
import 'package:t_truck_app/features/presentation/utils/base_controller.dart';
import 'package:t_truck_app/injection_container.dart';

class OccurrenceReasonController extends GetxController with BaseController {
  final OccurrenceListUseCase occurrenceListUseCase;
  final DevolutionSaveUseCase devolutionSaveUseCase;
  RxList<DropdownModel> reasonDevolution = <DropdownModel>[].obs;
  Rx<DropdownModel> selected = DropdownModel(id: 0, label: '').obs;
  Rx<TypeOccurrence> typeDevolution = TypeOccurrence.NONE.obs;

  OccurrenceReasonController({
    required this.occurrenceListUseCase,
    required this.devolutionSaveUseCase,
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

  void finishReson() async {
    var devolution = Get.find<DevolutionController>();
    var product = Get.find<ProductController>();
    typeDevolution = devolution.typeDevolution;

    if (typeDevolution.value == TypeOccurrence.YELLOW) {
      (await doDevolution(devolution, product)).fold(
        (l) => null,
        (r) {
          Get.to(() => PaymentPage(),
              binding: OrderPayBiding(), arguments: product.orderEntity.value);
        },
      );
    } else {
      (await doDevolution(devolution, product)).fold(
        (l) => null,
        (r) {
          Get.to(
              () => DevolutionFinish(
                    isDevolutionTotal: true,
                  ),
              arguments: product.orderEntity.value);
        },
      );
    }
  }

  Future<Either<Failure, void>> doDevolution(
      DevolutionController devolution, ProductController product) async {
    return await devolutionSaveUseCase(
      Params(
        listProductEntity: devolution.listProducts,
        motivoDevolucao: selected.value.label,
        orderEntity: product.orderEntity.value,
        typeOccurrence: typeDevolution.value,
      ),
    );
  }

  void changeDropdown(DropdownModel value) {
    selected.value = value;
  }
}
