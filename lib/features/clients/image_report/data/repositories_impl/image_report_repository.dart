import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/clients/image_report/data/external/image_report.dart';
import 'package:t_truck_app/features/clients/image_report/data/models/image_report_model.dart';

import '../../domain/repositories/i_image_report_repository.dart';

class ImageReportRepository implements IImageReportRepository {
  final IImageReport iImageReport;

  ImageReportRepository({
    required this.iImageReport,
  });
  @override
  Future<Either<Failure, List<ImageReportModel>>> getAll() async {
    try {
      return Right(await iImageReport.getAll());
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }

  @override
  Future<Either<Failure, void>> update(ImageReportModel obj) async {
    try {
      return Right(await iImageReport.update(obj));
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
