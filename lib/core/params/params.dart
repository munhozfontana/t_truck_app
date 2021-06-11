import 'package:equatable/equatable.dart';
import 'package:t_truck_app/features/clients/list_clients/domain/entites/client_entity.dart';

import '../../features/login/domain/entites/credential_entity.dart';

class Params extends Equatable {
  final CredentialEntity? credential;
  final String? token;
  final String? codmot;
  final String? motivoDevolucao;
  final int? codCli;
  final ClientEntity? clientEntity;

  Params({
    this.credential,
    this.token,
    this.codmot,
    this.motivoDevolucao,
    this.codCli,
    this.clientEntity,
  });

  @override
  List<Object> get props => [
        credential!,
        token!,
        codmot!,
        motivoDevolucao!,
        codCli!,
        clientEntity!,
      ];
}
