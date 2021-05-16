import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../domain/entites/credential_entity.dart';
import '../../models/credential_model.dart';
import '../adapters/i_http_external.dart';
import '../adapters/i_login_external.dart';

class LoginApi implements ILogin {
  IHttp iHttp;

  LoginApi({
    required this.iHttp,
  });

  @override
  Future<String> login(CredentialEntity credential) async {
    var res = await iHttp.postHttp(
      '${env['URL_BASE']}/login',
      body: CredentialModel(
        login: credential.login,
        password: credential.password,
      ).toJson(),
    );
    return jsonDecode(res.body!)['token'];
  }
}
