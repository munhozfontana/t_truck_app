import 'dart:convert';

import 'package:t_truck_app/features/domain/entites/credential.dart';

class CredentialModel extends Credential {
  CredentialModel({
    login,
    password,
  }) : super(
          login: login,
          password: password,
        );

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'password': password,
    };
  }

  factory CredentialModel.fromMap(Map<String, dynamic> map) {
    return CredentialModel(
      login: map['login'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CredentialModel.fromJson(String source) =>
      CredentialModel.fromMap(json.decode(source));
}
