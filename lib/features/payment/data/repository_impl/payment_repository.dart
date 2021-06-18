import 'package:dartz/dartz.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/messages/api_mensages.dart';
import '../../../clients/list_clients/data/models/client_model.dart';
import '../../../clients/list_products/data/models/product_receipt_model.dart';
import '../../domain/repositories/payment_repository.dart';
import '../external/channels/cielo_channel.dart';
import '../external/receipt_api.dart';

class PaymentRepository implements IPaymentRepository {
  final IReceiptExternal iReceiptExternal;

  PaymentRepository({required this.iReceiptExternal});

  @override
  Future<Either<Failure, void>> openPayments(ClientModel? clientEntity) async {
    try {
      var clientEntityCielo = ClientModel.orderToCielo(clientEntity);
      return Right(CieloRun().pay(clientEntityCielo));
    } on ApiException catch (e) {
      return Left(AppFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }

  @override
  Future<Either<Failure, List<ProductReceiptModel>>> getPayments() async {
    try {
      return Right(ProductReceiptModel.fromListCielo(
        await CieloRun().responsePayments(),
      ));
    } on ApiException catch (e) {
      return Left(AppFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }

  @override
  Future<Either<Failure, void>> savePayments(ClientModel clientModel) async {
    try {
      return Right(iReceiptExternal.save(clientModel.receipts));
    } on ApiException catch (e) {
      return Left(AppFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
