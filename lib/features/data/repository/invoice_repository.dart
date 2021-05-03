import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_invoice_external.dart';
import 'package:t_truck_app/features/domain/entites/invoice.dart';
import 'package:t_truck_app/features/domain/repositories/i_invoice_repository.dart';

class InvoiceRepository implements IInvoiceRepository {
  IInvoiceExternal iInvoiceExternal;

  InvoiceRepository({
    required this.iInvoiceExternal,
  });

  @override
  Future<Either<Failure, List<Invoice>>> list() async {
    try {
      return Right(await iInvoiceExternal.list());
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
