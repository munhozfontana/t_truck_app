import 'package:equatable/equatable.dart';
import 'package:t_truck_app/core/components/btn_occurrence.dart';

import '../../features/clients/list_clients/data/models/client_model.dart';
import '../../features/login/domain/entites/credential_entity.dart';

class Params extends Equatable {
  final CredentialEntity? credential;
  final String? token;
  final String? codmot;
  final String? motivoDevolucao;
  final int? codCli;
  final ClientModel? clinetModel;
  final TypeOccurrence? typeOccurrence;

  Params({
    this.credential,
    this.token,
    this.codmot,
    this.motivoDevolucao,
    this.codCli,
    this.clinetModel,
    this.typeOccurrence,
  });

  @override
  List<Object> get props => [
        credential!,
        token!,
        codmot!,
        motivoDevolucao!,
        codCli!,
        clinetModel!,
        typeOccurrence!,
      ];
}
