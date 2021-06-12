import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/clients/list_products/data/models/payment_type_gsa.dart';
import 'package:t_truck_app/features/clients/list_products/data/models/product_model.dart';

abstract class IProductRepository {
  Future<Either<Failure, Tuple2<List<ProductModel>, List<PaymentTypeGSA>>>>
      getId(int codCli);
}
