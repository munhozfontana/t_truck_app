import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_product_external.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/entites/product_entity.dart';
import 'package:t_truck_app/features/domain/repositories/i_product_repository.dart';

class ProductRepository implements IProductRepository {
  final IProductExternal iProductExternal;

  ProductRepository({
    required this.iProductExternal,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> list(
      List<Identificacao> listIdentificacao) async {
    try {
      return Right(await iProductExternal.list(listIdentificacao));
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
