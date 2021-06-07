import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../list_products/domain/entites/product_entity.dart';

abstract class IProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getId(int codCli);
}
