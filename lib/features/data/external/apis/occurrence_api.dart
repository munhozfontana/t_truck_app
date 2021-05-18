import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_occurrence_external.dart';
import 'package:t_truck_app/features/data/models/occurrence_model.dart';
import 'package:t_truck_app/features/domain/entites/occurrence_entity.dart';

class OccurrenceApi implements IOccurrenceExternal {
  IHttp iHttp;

  OccurrenceApi({
    required this.iHttp,
  });

  @override
  Future<List<OccurrenceEntity>> list() async {
    try {
      var res = await iHttp.getHttp(
        '${env['URL_BASE']}/reasons',
      );
      return OccurrenceModel.toListOccurrence(res.body!);
    } catch (e) {
      throw ApiException();
    }
  }
}
