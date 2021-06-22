import 'dart:convert';

import 'package:t_truck_app/core/utils/base_entity.dart';

class ImageEntity extends BaseEntity {
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

  String toJson() => json.encode(toMap());
}
