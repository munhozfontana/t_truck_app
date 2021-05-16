import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/features/data/external/adapters/i_devolution_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/models/devolution_model.dart';
import 'package:t_truck_app/features/domain/entites/devolution_entity.dart';

class DevolutionApi implements IDevolutionExternal {
  IHttp iHttp;

  DevolutionApi({
    required this.iHttp,
  });

  @override
  Future<List<DevolutionEntity>> list() async {
    try {
      var res = await iHttp.getHttp(
        '${env['URL_BASE']}/devolution',
      );
      return DevolutionModel.toListDevolution(res.body!);
    } catch (e) {
      throw ApiException();
    }
  }
}
