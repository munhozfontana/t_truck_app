import 'package:equatable/equatable.dart';
import 'package:t_truck_app/features/domain/entites/credential_entity.dart';

class Params extends Equatable {
  final CredentialEntity? credential;
  final String? token;

  Params({
    this.credential,
    this.token,
  });

  @override
  List<Object> get props => [
        credential!,
        token!,
      ];
}
