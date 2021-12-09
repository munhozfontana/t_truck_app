import 'package:get/get.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/core/utils/app_utils.dart';
import 'package:t_truck_app/features/clients/finish/devolution_finish_biding.dart';
import 'package:t_truck_app/features/clients/finish/ui/page/devolution_finish.dart';
import 'package:t_truck_app/features/clients/image_report/domain/use_cases/image_report_update_use_case.dart';
import 'package:t_truck_app/features/clients/image_report_detail/image_report_detail_controller.dart';

class ImageReportUploadController extends GetxController {
  final ImageReportUpdateUseCase imageReportUpdateUseCase;

  ImageReportUploadController({
    required this.imageReportUpdateUseCase,
  });

  updateImage(String base64encode) {
    imageReportUpdateUseCase(
      Params(
          imageReportModel: Get.find<ImageReportDetailController>()
              .imageReportModel!
              .value
              .copyWith(imgCanhoto: base64encode)),
    ).then((value) => value.fold(
          (l) => AppUtils.error(menssagem: l.props.toString()),
          (r) => AppUtils.show(menssagem: 'Canhoto atualizado com sucesso'),
        ));

    Get.to(() => DevolutionFinish(), binding: DevolutionFinishBiding());
  }
}
