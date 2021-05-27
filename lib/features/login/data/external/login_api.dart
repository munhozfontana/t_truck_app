import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/adapters/protocols/i_http_external.dart';
import '../../domain/entites/credential_entity.dart';
import '../models/credential_model.dart';

abstract class ILogin {
  Future<String> login(CredentialEntity credential);
}

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
