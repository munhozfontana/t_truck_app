import 'package:t_truck_app/features/domain/entites/credential_entity.dart';

abstract class ILogin {
  Future<String> login(CredentialEntity credential);
}
