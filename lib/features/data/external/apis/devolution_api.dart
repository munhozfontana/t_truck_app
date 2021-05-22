import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
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
  Future<void> save(List<DevolutionEntity> devolutionEntity) async {
    try {
      devolutionEntity.forEach((element) async {
        await iHttp.postHttp('${env['URL_BASE']}/devolution',
            body: DevolutionModel.toJson(element));
      });
    } catch (e) {
      throw ApiException(error: ApiMensages.GENERIC_ERROR);
    }
  }
}
