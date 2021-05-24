class CredentialEntity {
  final String login;
  final String password;

  CredentialEntity({
    required this.login,
    required this.password,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CredentialEntity &&
        other.login == login &&
        other.password == password;
  }

  @override
  int get hashCode => login.hashCode ^ password.hashCode;
}
