import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/adapters/protocols/i_connectivity_external.dart';

import '../../../../../core/error/api_exception.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/messages/api_mensages.dart';
import '../../../list_clients/data/models/payment_type_gsa.dart';
import '../../../list_products/data/models/product_model.dart';
import '../../domain/repositories/i_product_repository.dart';
import '../external/product_api.dart';

class ProductRepository implements IProductRepository {
  final IProduct iProduct;
  final IConnectivity iConnectivity;

  ProductRepository({
    required this.iProduct,
    required this.iConnectivity,
  });

  @override
  Future<
      Either<Failure,
          Tuple3<List<ProductModel>, List<PaymentTypeGSA>, bool>>> getId(
      codCli) async {
    try {
      if (await iConnectivity.isConnected()) {
        return Right(await iProduct.getId(codCli));
      } else {
        return Left(
          ConectionFailure(
              detail:
                  'Falha de conexão, verifique sua internet ou tente novamente mais tarde'),
        );
      }
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
