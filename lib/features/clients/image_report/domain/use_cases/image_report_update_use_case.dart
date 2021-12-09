import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/core/use_case.dart';
import 'package:t_truck_app/features/clients/image_report/domain/repositories/i_image_report_repository.dart';

class ImageReportUpdateUseCase implements UseCaseAsync<Type, Params> {
  final IImageReportRepository iImageReportRepository;

  ImageReportUpdateUseCase({
    required this.iImageReportRepository,
  });

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return iImageReportRepository.update(params.imageReportModel!);
  }
}
