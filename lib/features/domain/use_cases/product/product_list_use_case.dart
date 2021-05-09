import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/core/use_case.dart';
import 'package:t_truck_app/features/domain/entites/product_entity.dart';

class ProductUseCase implements UseCaseAsync<Type, Params> {
  @override
  Future<Either<Failure, List<ProductEntity>>> call(Params params) async {
    return Right([
      ProductEntity(codProd: 1, descricao: 'teste1'),
      ProductEntity(codProd: 2, descricao: 'teste2'),
      ProductEntity(codProd: 3, descricao: 'teste3'),
      ProductEntity(codProd: 4, descricao: 'teste4'),
      ProductEntity(codProd: 5, descricao: 'teste5'),
    ]);
  }
}
