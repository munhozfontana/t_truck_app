import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../../core/adapters/protocols/i_http_external.dart';
import '../../../../../core/components/dropdown_default.dart';
import '../../../../../core/error/api_exception.dart';
import '../../../../../core/messages/api_mensages.dart';
import '../models/devolution_model.dart';

mixin IDevolutionExternal {
  Future<List<DropdownModel>> list();
  Future<void> save(List<DevolutionModel> listDevolution);
}

class DevolutionApi implements IDevolutionExternal {
  IHttp iHttp;

  DevolutionApi({
    required this.iHttp,
  });

  @override
  Future<List<DropdownModel>> list() async {
    try {
      var res = await iHttp.getHttp(
        '${env['URL_BASE']}/reasons',
      );
      List list = jsonDecode(res.body!);
      return list
          .map(
            (element) => DropdownModel(
              id: element['CODDEVOL'],
              label: element['MOTIVO'],
            ),
          )
          .toList();
    } catch (e) {
      throw ApiException();
    }
  }

  @override
  Future<void> save(List<DevolutionModel> listDevolution) async {
    try {
      listDevolution.forEach((element) async {
        print(element.toJson());
        await iHttp.postHttp('${env['URL_BASE']}/devolution',
            body: element.toJson());
      });
    } catch (e) {
      throw ApiException(error: ApiMensages.GENERIC_ERROR);
    }
  }
}
