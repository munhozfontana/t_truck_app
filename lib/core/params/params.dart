import 'package:equatable/equatable.dart';
import 'package:t_truck_app/features/domain/entites/credential_entity.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';

class Params extends Equatable {
  final CredentialEntity? credential;
  final String? token;
  final List<Identificacao>? listIdentificacao;

  Params({
    this.credential,
    this.token,
    this.listIdentificacao,
  });

  @override
  List<Object> get props => [
        credential!,
        token!,
        listIdentificacao!,
      ];
}
