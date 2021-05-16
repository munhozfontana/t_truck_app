import 'dart:convert';

import '../../domain/entites/devolution_entity.dart';

class DevolutionModel extends DevolutionEntity {
  DevolutionModel({
    required int codProduto,
    required String descricao,
  }) : super(
          codProduto: codProduto,
          descricao: descricao,
        );

  factory DevolutionModel.fromMap(Map<String, dynamic> map) {
    return DevolutionModel(
      codProduto: map['CODDEVOL'],
      descricao: map['MOTIVO'],
    );
  }

  factory DevolutionModel.fromJson(String source) =>
      DevolutionModel.fromMap(json.decode(source));

  static List<DevolutionEntity> toListDevolution(String value) {
    List list = jsonDecode(value);
    return list.map((devolution) {
      return DevolutionModel.fromMap(devolution);
    }).toList();
  }
}
