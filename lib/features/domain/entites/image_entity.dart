class ImageEntity {
  final String canhoto;
  final String estabelecimento;
  final DateTime data;
  final int codCli;
  String numcanhoto;

  ImageEntity({
    required this.canhoto,
    required this.estabelecimento,
    required this.data,
    required this.codCli,
    required this.numcanhoto,
  });

  ImageEntity copyWith({
    String? canhoto,
    String? estabelecimento,
    DateTime? data,
    int? codCli,
    String? numcanhoto,
  }) {
    return ImageEntity(
      canhoto: canhoto ?? this.canhoto,
      estabelecimento: estabelecimento ?? this.estabelecimento,
      data: data ?? this.data,
      codCli: codCli ?? this.codCli,
      numcanhoto: numcanhoto ?? this.numcanhoto,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageEntity &&
        other.canhoto == canhoto &&
        other.estabelecimento == estabelecimento &&
        other.data == data &&
        other.codCli == codCli &&
        other.numcanhoto == numcanhoto;
  }

  @override
  int get hashCode {
    return canhoto.hashCode ^
        estabelecimento.hashCode ^
        data.hashCode ^
        codCli.hashCode ^
        numcanhoto.hashCode;
  }
}
