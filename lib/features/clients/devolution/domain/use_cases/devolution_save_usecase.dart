import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:t_truck_app/core/adapters/protocols/i_logged_user.dart';
import 'package:t_truck_app/core/components/btn_occurrence.dart';
import 'package:t_truck_app/features/clients/devolution/data/models/devolution_model.dart';
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

    var list = params.clinetModel!.produtos
        .where((element) => element.quantity != 0)
        .map((e) => DevolutionModel(
              codprod: e.cODPROD,
              qt: e.quantity.toString(),
              data: DateFormat('dd/MM/yyyy HH:mm:ss')
                  .format(DateTime.now())
                  .toString(),
              codcli: params.clinetModel!.codCli,
              numtransvenda: e.nUMTRANSVENDA,
              codmot: codMot,
              situacao: params.typeOccurrence == TypeOccurrence.YELLOW
                  ? 'DEVP'
                  : 'DEVT',
            ))
        .toList();

    return iDevolutionSaveRepository.save(list);
  }
}
