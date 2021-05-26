import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/core/use_case.dart';
import 'package:t_truck_app/features/domain/entites/tipo_transacao_entity.dart';
import 'package:t_truck_app/features/domain/repositories/i_tipo_transacao_repository.dart';

class TipoTransacaoUseCase implements UseCaseAsync<Type, Params> {
  ITipoTransacaoRepository iTipoTransacaoRepository;

  TipoTransacaoUseCase({
    required this.iTipoTransacaoRepository,
  });

  @override
  Future<Either<Failure, List<TipoTransacaoEntity>>> call(Params params) async {
    return await iTipoTransacaoRepository.getByOrder(
      params.orderEntity!,
    );
  }
}
