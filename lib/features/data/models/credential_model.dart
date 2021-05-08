import 'dart:convert';

import 'package:t_truck_app/features/domain/entites/credential_entity.dart';

class CredentialModel extends CredentialEntity {
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

  CredentialEntity copyWith({
    String? login,
    String? password,
  }) {
    return CredentialEntity(
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  factory CredentialModel.fromJson(String source) =>
      CredentialModel.fromMap(json.decode(source));
}
