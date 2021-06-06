import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:t_truck_app/features/clients/list_clients/data/models/clients_model.dart';
import 'package:t_truck_app/features/clients/list_clients/domain/repositores/i_clients_repository.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/params/params.dart';
import '../../../../../core/use_case.dart';

class ClientListUseCase implements UseCaseAsync<Type, Params> {
  final IClientsRepository iClientsRepository;

  ClientListUseCase({
    required this.iClientsRepository,
  });

  @override
  Future<Either<Failure, List<ClientModel>>> call(Params params) async {
    return await iClientsRepository.getAll();
  }
}
