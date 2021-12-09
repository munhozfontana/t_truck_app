import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/clients/image_report/data/models/image_report_model.dart';
import 'package:t_truck_app/features/clients/image_report/domain/use_cases/image_report_list_use_case.dart';
import 'package:t_truck_app/features/clients/image_report/domain/use_cases/image_report_update_use_case.dart';
import 'package:t_truck_app/features/clients/image_report_detail/image_report_detail_bindings.dart';
import 'package:t_truck_app/features/clients/image_report_detail/image_report_detail_page.dart';

class ImageReportController extends GetxController {
  ImageReportListUseCase imageReportListUseCase;
  ImageReportUpdateUseCase imageReportUpdateUseCase;

  RxList<ImageReportModel> list = <ImageReportModel>[].obs;

  ImageReportController({
    required this.imageReportListUseCase,
    required this.imageReportUpdateUseCase,
  });

  @override
  void onInit() {
    super.onInit();
    getReportList();
  }

  void getReportList() async {
    (await imageReportListUseCase(Params())).fold(
      (l) => null,
      (r) => {
        list.addAll(r),
        list.refresh(),
      },
    );
  }

  void openReport(ImageReportModel imageReportModel) {
    Get.to(
      () => ImageReportDetailPage(),
      binding: ImageReportDetailBindings(),
      arguments: imageReportModel,
    );
  }
}
