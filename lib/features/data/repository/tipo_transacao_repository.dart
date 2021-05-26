import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_tipo_transacao_external.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/entites/tipo_transacao_entity.dart';
import 'package:t_truck_app/features/domain/repositories/i_tipo_transacao_repository.dart';

class TipoTransacaoRepository implements ITipoTransacaoRepository {
  final ITipoTransacaoExternal iTipoTransacaoExternal;

  TipoTransacaoRepository({
    required this.iTipoTransacaoExternal,
  });

  @override
  Future<Either<Failure, List<TipoTransacaoEntity>>> getByOrder(
      OrderEntity orderEntity) async {
    try {
      return Right(await iTipoTransacaoExternal.getByOrder(orderEntity));
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
