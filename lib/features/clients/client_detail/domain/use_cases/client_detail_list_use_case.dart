import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/params/params.dart';
import '../../../../../core/use_case.dart';
import '../../../list_products/domain/entites/product_entity.dart';
import '../repositories/i_product_repository.dart';

class ProductListUseCase implements UseCaseAsync<Type, Params> {
  final IProductRepository iProductRepository;

  ProductListUseCase({
    required this.iProductRepository,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> call(Params params) async {
    return iProductRepository.getId(166641);
  }
}
