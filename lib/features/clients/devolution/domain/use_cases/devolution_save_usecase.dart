import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/adapters/protocols/i_logged_user.dart';
import 'package:t_truck_app/features/clients/devolution/domain/repositories/i_devolution_repository.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/params/params.dart';
import '../../../../../core/use_case.dart';

class DevolutionSaveUseCase implements UseCaseAsync<Type, Params> {
  IDevolutionRepository iDevolutionSaveRepository;
  ILoggedUser iLoggedUser;

  DevolutionSaveUseCase({
    required this.iDevolutionSaveRepository,
    required this.iLoggedUser,
  });

  @override
  Future<Either<Failure, void>> call(Params params) async {
    var codMot = await iLoggedUser.login;

    var list = params.listProductEntity!
        .map(
          (e) => DevolutionEntity(
            productEntity: ProductEntity(
              codProd: e.codProd,
              descricao: e.descricao,
              qt: e.qt,
              qtToSend: e.qtToSend,
              transacaoVendaEntity: e.transacaoVendaEntity,
            ),
            orderEntity: params.orderEntity!,
            situacao: params.typeOccurrence == TypeOccurrence.YELLOW
                ? 'DEVP'
                : 'DEVT',
            date: DateTime.now(),
            codmot: codMot,
          ),
        )
        .toList();

    list.removeWhere((element) => element.productEntity.qtToSend == 0);

    return iDevolutionSaveRepository.save(list);
  }
}
