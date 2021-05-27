import 'package:t_truck_app/features/login/domain/entites/credential_entity.dart';

abstract class ILogin {
  Future<String> login(CredentialEntity credential);
}
