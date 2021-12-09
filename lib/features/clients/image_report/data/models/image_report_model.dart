import 'dart:convert';

import 'package:t_truck_app/features/clients/image_report/domain/entities/image_report_entity.dart';
import 'package:uuid/uuid.dart';

class ImageReportModel extends ImageReportEntity {
  final String numTransVenda;
  final String? imgCanhoto;

  ImageReportModel({
    required String id,
    required String description,
    required String subDescription,
    required String percent,
    required this.numTransVenda,
    this.imgCanhoto,
  }) : super(
          id: id,
          description: description,
          subDescription: subDescription,
          percent: percent,
        );

  ImageReportModel copyWith({
    String? id,
    String? description,
    String? subDescription,
    String? percent,
    String? numTransVenda,
    String? imgCanhoto,
  }) {
    return ImageReportModel(
      id: id ?? this.id,
      description: description ?? this.description,
      subDescription: subDescription ?? this.subDescription,
      percent: percent ?? this.percent,
      numTransVenda: numTransVenda ?? this.numTransVenda,
      imgCanhoto: imgCanhoto ?? this.imgCanhoto,
    );
  }

  factory ImageReportModel.fromMap(Map<String, dynamic> map) {
    return ImageReportModel(
      id: Uuid().v4(),
      description: map['CLIENTE'],
      subDescription: (map['NUMNOTA'] as int).toString(),
      percent: map['PERCENT_OCR'],
      numTransVenda: map['NUMTRANSVENDA'],
    );
  }

  factory ImageReportModel.fromJson(String source) =>
      ImageReportModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'numTransVenda': numTransVenda,
      'canhoto': imgCanhoto,
    };
  }

  String toJson() => json.encode(toMap());
}
