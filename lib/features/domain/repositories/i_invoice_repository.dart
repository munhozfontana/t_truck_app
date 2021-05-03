import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/domain/entites/invoice.dart';

abstract class IInvoiceRepository {
  Future<Either<Failure, List<Invoice>>> list();
}
