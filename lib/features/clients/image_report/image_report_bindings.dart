import 'package:get/get.dart';
import 'package:t_truck_app/features/clients/image_report/data/external/image_report.dart';
import 'package:t_truck_app/features/clients/image_report/data/repositories_impl/image_report_repository.dart';
import 'package:t_truck_app/features/clients/image_report/domain/repositories/i_image_report_repository.dart';
import 'package:t_truck_app/features/clients/image_report/domain/use_cases/image_report_update_use_case.dart';
import 'package:t_truck_app/features/clients/image_report/ui/page/image_report_controller.dart';

import 'domain/use_cases/image_report_list_use_case.dart';

class ImageReportBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IImageReport>(
      () => ImageReportApi(
        iHttp: Get.find(),
      ),
    );

    Get.lazyPut<IImageReportRepository>(
      () => ImageReportRepository(
        iImageReport: Get.find(),
      ),
    );

    Get.lazyPut(
      () => ImageReportListUseCase(
        iImageReportRepository: Get.find(),
      ),
    );

    Get.lazyPut(
      () => ImageReportUpdateUseCase(
        iImageReportRepository: Get.find(),
      ),
    );

    Get.put(
      ImageReportController(
        imageReportListUseCase: Get.find(),
        imageReportUpdateUseCase: Get.find(),
      ),
    );
  }
}
