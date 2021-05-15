import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/domain/entites/product_entity.dart';
import 'package:t_truck_app/features/domain/entites/transacao_venda_entity.dart';

abstract class IProductRepository {
  Future<Either<Failure, List<ProductEntity>>> list(
      List<TransacaoVendaEntity> listIdentificacao);
}
