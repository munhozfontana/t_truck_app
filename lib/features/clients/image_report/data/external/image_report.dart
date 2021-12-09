import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_truck_app/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/features/clients/image_report/data/models/image_report_model.dart';

mixin IImageReport {
  Future<List<ImageReportModel>> getAll();
  Future<void> update(ImageReportModel obj);
}

class ImageReportApi implements IImageReport {
  IHttp iHttp;

  ImageReportApi({
    required this.iHttp,
  });

  @override
  Future<List<ImageReportModel>> getAll() async {
    try {
      var res = await iHttp.getHttp(
        '${env['URL_BASE']}/returnImage',
      );
      Map resDecoded = json.decode(res.body!);
      return (resDecoded['percentImage'] as List)
          .map(
            (e) => ImageReportModel.fromMap(e),
          )
          .toList();
    } on ApiException catch (e) {
      throw ApiException(error: e.toString());
    } catch (e) {
      throw ApiException(
          error: 'Erro ao obter lista de imagens com baixa qualidade');
    }
  }

  @override
  Future<void> update(ImageReportModel obj) async {
    try {
      await iHttp.putHttp(
        '${env['URL_BASE']}/image',
        body: obj.toJson(),
      );
      return Future.value();
    } on ApiException catch (e) {
      throw ApiException(error: e.toString());
    } catch (e) {
      throw ApiException(error: 'Erro ao atualizar a imagem');
    }
  }
}
