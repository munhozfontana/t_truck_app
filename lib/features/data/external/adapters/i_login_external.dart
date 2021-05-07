import 'package:t_truck_app/features/domain/entites/credential_entity.dart';

abstract class ILogin {
  Future<bool> login(CredentialEntity credential);
}
