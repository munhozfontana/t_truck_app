import 'i_jwt_external.dart';
import 'i_local_store_external.dart';

mixin ILoggedUser {
  Future<String> get login;

  Future<bool> loginExpired();
}

class LoggedUser implements ILoggedUser {
  final IJwt iJwt;
  final ILocalStoreExternal iLocalStoreExternal;

  LoggedUser({
    required this.iJwt,
    required this.iLocalStoreExternal,
  });

  @override
  // TODO: implement login
  Future<String> get login => Future.value('10009321');

  @override
  Future<bool> loginExpired() {
    return Future.value(false);
  }
}
