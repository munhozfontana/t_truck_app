import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/clients/image_report/data/models/image_report_model.dart';

abstract class IImageReportRepository {
  Future<Either<Failure, List<ImageReportModel>>> getAll();
  Future<Either<Failure, void>> update(ImageReportModel obj);
}
