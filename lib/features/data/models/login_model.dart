import 'dart:convert';

import 'package:t_truck_app/features/domain/entites/credential.dart';

class CredentialModel extends Credential {
  CredentialModel({
    required String login,
    required String pass,
  }) : super(
          login: login,
          pass: pass,
        );

  CredentialModel copyWith({
    String? login,
    String? pass,
  }) {
    return CredentialModel(
      login: login ?? this.login,
      pass: pass ?? this.pass,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'pass': pass,
    };
  }

  factory CredentialModel.fromMap(Map<String, dynamic> map) {
    return CredentialModel(
      login: map['login'],
      pass: map['pass'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CredentialModel.fromJson(String source) =>
      CredentialModel.fromMap(json.decode(source));

  @override
  String toString() => 'CredentialModel(login: $login, pass: $pass)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CredentialModel &&
        other.login == login &&
        other.pass == pass;
  }

  @override
  int get hashCode => login.hashCode ^ pass.hashCode;
}
