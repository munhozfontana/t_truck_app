import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_login_external.dart';
import 'package:t_truck_app/features/domain/entites/credential_entity.dart';

class LoginApi implements ILogin {
  IHttp iHttp;

  LoginApi({
    required this.iHttp,
  });

  @override
  Future<bool> login(CredentialEntity credential) async {
    var res =
        await iHttp.postHttp('${env['URL_BASE']}/login', body: credential);
    return res.statusCode! >= 200;
  }
}
