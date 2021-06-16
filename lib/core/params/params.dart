import 'package:equatable/equatable.dart';
import 'package:t_truck_app/core/components/btn_occurrence.dart';
import 'package:t_truck_app/core/components/dropdown_default.dart';

import '../../features/clients/list_clients/data/models/client_model.dart';
import '../../features/login/domain/entites/credential_entity.dart';

class Params extends Equatable {
  final CredentialEntity? credential;
  final String? token;
  final String? codmot;
  final String? motivoDevolucao;
  final int? codCli;
  final ClientModel? clientModel;
  final TypeOccurrence? typeOccurrence;
  final DropdownModel? selected;

  Params({
    this.credential,
    this.token,
    this.codmot,
    this.motivoDevolucao,
    this.codCli,
    this.clientModel,
    this.typeOccurrence,
    this.selected,
  });

  @override
  List<Object> get props => [
        credential!,
        token!,
        codmot!,
        motivoDevolucao!,
        codCli!,
        clientModel!,
        typeOccurrence!,
      ];
}
