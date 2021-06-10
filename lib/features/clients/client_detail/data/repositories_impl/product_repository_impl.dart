import 'package:dartz/dartz.dart';
import 'package:t_truck_app/features/clients/list_products/data/models/product_model.dart';

import '../../../../../core/error/api_exception.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/messages/api_mensages.dart';
import '../../domain/repositories/i_product_repository.dart';
import '../external/product_api.dart';

class ProductRepository implements IProductRepository {
  final IProduct iProduct;

  ProductRepository({
    required this.iProduct,
  });

  @override
  Future<Either<Failure, List<ProductModel>>> getId(codCli) async {
    try {
      return Right(await iProduct.getId(codCli));
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
