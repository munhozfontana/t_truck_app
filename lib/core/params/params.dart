import 'package:equatable/equatable.dart';

import '../../features/login/domain/entites/credential_entity.dart';

class Params extends Equatable {
  final CredentialEntity? credential;
  final String? token;
  final String? codmot;
  final String? motivoDevolucao;
  final int? codCli;

  Params({
    this.credential,
    this.token,
    this.codmot,
    this.motivoDevolucao,
    this.codCli,
  });

  @override
  List<Object> get props => [
        credential!,
        token!,
        codmot!,
        motivoDevolucao!,
        codCli!,
      ];
}
