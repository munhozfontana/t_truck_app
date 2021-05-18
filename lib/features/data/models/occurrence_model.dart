import 'dart:convert';

import '../../domain/entites/occurrence_entity.dart';

class OccurrenceModel extends OccurrenceEntity {
  OccurrenceModel({
    required int codProduto,
    required String descricao,
  }) : super(
          codProduto: codProduto,
          descricao: descricao,
        );

  factory OccurrenceModel.fromMap(Map<String, dynamic> map) {
    return OccurrenceModel(
      codProduto: map['CODDEVOL'],
      descricao: map['MOTIVO'],
    );
  }

  factory OccurrenceModel.fromJson(String source) =>
      OccurrenceModel.fromMap(json.decode(source));

  static List<OccurrenceEntity> toListOccurrence(String value) {
    List list = jsonDecode(value);
    return list.map((devolution) {
      return OccurrenceModel.fromMap(devolution);
    }).toList();
  }
}
