import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../clients/list_clients/data/models/client_model.dart';
import '../../../clients/list_products/data/models/product_receipt_model.dart';

mixin IPaymentRepository {
  Future<Either<Failure, void>> openPayments(ClientModel? clientEntity);
  Future<Either<Failure, List<ProductReceiptModel>>> getPayments();
  Future<Either<Failure, void>> savePayments(ClientModel clientModel);
}
