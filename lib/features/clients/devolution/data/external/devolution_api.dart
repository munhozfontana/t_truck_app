import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../../core/adapters/protocols/i_http_external.dart';
import '../../../../../core/components/dropdown_default.dart';
import '../../../../../core/error/api_exception.dart';

mixin IDevolutionExternal {
  Future<List<DropdownModel>> list();
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
}
