import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../list_clients/data/models/payment_type_gsa.dart';
import '../../../list_products/data/models/product_model.dart';

abstract class IProductRepository {
  Future<Either<Failure, Tuple2<List<ProductModel>, List<PaymentTypeGSA>>>>
      getId(int codCli);
}
