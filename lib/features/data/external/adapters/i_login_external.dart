import 'package:t_truck_app/features/domain/entites/credential.dart';

abstract class ILogin {
  Future<bool> login(Credential credential);
}
