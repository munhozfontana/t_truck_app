import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/entites/tipo_transacao_entity.dart';

mixin ITipoTransacaoRepository {
  Future<Either<Failure, List<TipoTransacaoEntity>>> getByOrder(
      OrderEntity listIdentificacao);
}
