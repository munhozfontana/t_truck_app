import 'package:dartz/dartz.dart';
import 'package:t_truck_app/features/clients/list_products/data/models/product_model.dart';

import '../../../../../core/error/failures.dart';

abstract class IProductRepository {
  Future<Either<Failure, List<ProductModel>>> getId(int codCli);
}
