import 'package:equatable/equatable.dart';
import 'package:t_truck_app/features/domain/entites/credential.dart';

class Params extends Equatable {
  final Credential? credential;

  Params({
    this.credential,
  });

  @override
  List<Object> get props => [
        credential!,
      ];
}
