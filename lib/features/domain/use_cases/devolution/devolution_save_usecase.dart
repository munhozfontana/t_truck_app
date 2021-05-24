import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/core/use_case.dart';
import 'package:t_truck_app/features/data/repository/order_repository.dart';
import 'package:t_truck_app/features/domain/entites/devolution_entity.dart';
import 'package:t_truck_app/features/domain/entites/product_entity.dart';
import 'package:t_truck_app/features/domain/repositories/devolution_repository.dart';
import 'package:t_truck_app/features/presentation/components/btn_occurrence.dart';

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

    return iDevolutionSaveRepository.save(list);
  }
}
