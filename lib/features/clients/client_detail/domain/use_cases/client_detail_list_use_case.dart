import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/params/params.dart';
import '../../../../../core/use_case.dart';
import '../../../list_clients/data/models/payment_type_gsa.dart';
import '../../../list_products/data/models/product_model.dart';
import '../repositories/i_product_repository.dart';

class ProductListUseCase implements UseCaseAsync<Type, Params> {
  final IProductRepository iProductRepository;

  ProductListUseCase({
    required this.iProductRepository,
  });
  @override
  Future<
      Either<Failure,
          Tuple3<List<ProductModel>, List<PaymentTypeGSA>, bool>>> call(
      Params params) async {
    return iProductRepository.getId(params.codCli!);
  }
}
