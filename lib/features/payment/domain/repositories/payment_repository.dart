import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/clients/list_clients/data/models/client_model.dart';
import 'package:t_truck_app/features/clients/list_products/data/models/product_receipt_model.dart';

mixin IPaymentRepository {
  Future<Either<Failure, void>> openPayments(ClientModel? clientEntity);
  Future<Either<Failure, List<ProductReceiptModel>>> getPayments();
  Future<Either<Failure, ProductReceiptModel>> savePayments(
      List<ProductReceiptModel> listCLientModel);
}
