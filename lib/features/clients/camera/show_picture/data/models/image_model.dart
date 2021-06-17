import 'dart:convert';

import 'package:t_truck_app/features/clients/camera/show_picture/domain/entites/image_entity.dart';

class ImageModel extends ImageEntity {
  final String? data;
  final int? codCli;
  final String? numcanhoto;

  ImageModel({
    required String imgCanhotoBase64,
    required String imgEstabelecimentoBase64,
    this.data,
    this.codCli,
    this.numcanhoto,
  }) : super(
          imgCanhotoBase64: imgCanhotoBase64,
          imgEstabelecimentoBase64: imgEstabelecimentoBase64,
        );

  @override
  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'codCli': codCli,
      'numcanhoto': numcanhoto,
      ...super.toMap()
    };
  }

  @override
  String toJson() => json.encode(toMap());

  ImageModel copyWith({
    String? data,
    int? codCli,
    String? numcanhoto,
  }) {
    return ImageModel(
        data: data ?? this.data,
        codCli: codCli ?? this.codCli,
        numcanhoto: numcanhoto ?? this.numcanhoto,
        imgCanhotoBase64: super.imgCanhotoBase64,
        imgEstabelecimentoBase64: super.imgEstabelecimentoBase64);
  }
}
