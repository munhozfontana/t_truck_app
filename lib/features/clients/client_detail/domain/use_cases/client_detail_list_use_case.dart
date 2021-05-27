import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/core/use_case.dart';
import 'package:t_truck_app/features/domain/entites/product_entity.dart';
import 'package:t_truck_app/features/domain/repositories/i_product_repository.dart';

class ProductListUseCase implements UseCaseAsync<Type, Params> {
  IProductRepository iProductRepository;

  ProductListUseCase({
    required this.iProductRepository,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> call(Params params) async {
    return await iProductRepository.list(params.listIdentificacao!);
  }
}
