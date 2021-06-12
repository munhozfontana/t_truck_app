import 'package:dartz/dartz.dart';
import 'package:t_truck_app/features/clients/list_products/data/models/payment_type_gsa.dart';
import 'package:t_truck_app/features/clients/list_products/data/models/product_model.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/params/params.dart';
import '../../../../../core/use_case.dart';
import '../repositories/i_product_repository.dart';

class ProductListUseCase implements UseCaseAsync<Type, Params> {
  final IProductRepository iProductRepository;

  ProductListUseCase({
    required this.iProductRepository,
  });

  @override
  Future<Either<Failure, Tuple2<List<ProductModel>, List<PaymentTypeGSA>>>>
      call(Params params) async {
    return iProductRepository.getId(params.codCli!);
  }
}
