import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/params/params.dart';
import '../../../../../core/use_case.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../data/models/client_model.dart';
import '../repositores/i_clients_repository.dart';

class ClientListUseCase implements UseCaseAsync<Type, Params> {
  final IClientsRepository iClientsRepository;

  ClientListUseCase({
    required this.iClientsRepository,
  });

  @override
  Future<Either<Failure, List<ClientModel>>> call(Params params) async {
    var request = await iClientsRepository.getAll();

    request.fold(
      (l) => null,
      (r) => {
        if (r.isEmpty)
          AppUtils.show(titulo: 'Atenção', menssagem: 'Você não possui pedidos')
      },
    );

    return request;
  }
}
