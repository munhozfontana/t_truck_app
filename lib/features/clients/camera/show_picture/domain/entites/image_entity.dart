import 'dart:convert';

import 'package:uuid/uuid.dart';

class ImageEntity {
  String id = Uuid().v4();
  final String imgCanhotoBase64;
  final String imgEstabelecimentoBase64;

  ImageEntity({
    required this.imgCanhotoBase64,
    required this.imgEstabelecimentoBase64,
  });

  Map<String, dynamic> toMap() {
    return {
      'canhoto': imgCanhotoBase64,
      'estabelecimento': imgEstabelecimentoBase64,
    };
  }

  factory ImageEntity.fromMap(Map<String, dynamic> map) {
    return ImageEntity(
      imgCanhotoBase64: map['imgCanhotoBase64'],
      imgEstabelecimentoBase64: map['imgEstabelecimentoBase64'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageEntity.fromJson(String source) =>
      ImageEntity.fromMap(json.decode(source));
}
