import 'package:t_truck_app/features/data/external/adapters/i_http.dart';
import 'package:t_truck_app/features/data/external/adapters/i_login.dart';
import 'package:t_truck_app/features/domain/entites/credential.dart';

class LoginApi implements ILogin {
  IHttp iHttp;

  LoginApi({
    required this.iHttp,
  });

  @override
  Future<bool> login(Credential credential) async {
    // var res = await iHttp.postHttp(
    //     'https://6085bc0fd14a870017578395.mockapi.io/login',
    //     body: credential);
    // return json.decode(res.body!)['auth'];
    return true;
  }
}
