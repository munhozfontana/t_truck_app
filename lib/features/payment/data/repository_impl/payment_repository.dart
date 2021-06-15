import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/clients/list_clients/data/models/client_model.dart';
import 'package:t_truck_app/features/clients/list_products/data/models/product_receipt_model.dart';
import 'package:t_truck_app/features/payment/data/external/channels/cielo_channel.dart';
import 'package:t_truck_app/features/payment/domain/repositories/payment_repository.dart';

class PaymentRepository implements IPaymentRepository {
  final IReceiptExternal iReceiptExternal;

  PaymentRepository({required this.iReceiptExternal});

  @override
  Future<Either<Failure, void>> openPayments(ClientModel? clientEntity) async {
    try {
      return Right(CieloRun().pay(ClientModel.orderToCielo(clientEntity)));
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
  Future<Either<Failure, ProductReceiptModel>> savePayments(
      List<ProductReceiptModel> listCLientModel) {
    // TODO: implement savePayments
    throw UnimplementedError();
  }
}

mixin IReceiptExternal {
  Future<void> save(List<ProductReceiptModel> object);
}
