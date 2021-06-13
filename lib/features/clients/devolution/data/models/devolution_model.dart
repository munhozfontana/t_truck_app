import 'dart:convert';

import 'package:t_truck_app/features/clients/devolution/domain/entites/devolution_entity.dart';

class DevolutionModel extends DevolutionEntity {
  @override
  int codprod;
  @override
  String qt;
  @override
  String data;
  @override
  int codcli;
  @override
  int numtransvenda;
  @override
  String codmot;
  @override
  String situacao;

  DevolutionModel({
    required this.codprod,
    required this.qt,
    required this.data,
    required this.codcli,
    required this.numtransvenda,
    required this.codmot,
    required this.situacao,
  }) : super(
          codprod: codprod,
          qt: qt,
          data: data,
          codcli: codcli,
          numtransvenda: numtransvenda,
          codmot: codmot,
          situacao: situacao,
        );

  Map<String, dynamic> toMap() {
    return {
      'codprod': codprod,
      'qt': qt,
      'data': data,
      'codcli': codcli,
      'numtransvenda': numtransvenda,
      'codmot': codmot,
      'situacao': situacao,
    };
  }

  factory DevolutionModel.fromMap(Map<String, dynamic> map) {
    return DevolutionModel(
      codprod: map['codprod'],
      qt: map['qt'],
      data: map['data'],
      codcli: map['codcli'],
      numtransvenda: map['numtransvenda'],
      codmot: map['codmot'],
      situacao: map['situacao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DevolutionModel.fromJson(String source) =>
      DevolutionModel.fromMap(json.decode(source));
}
