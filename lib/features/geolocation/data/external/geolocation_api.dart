import 'dart:developer';

import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/geolocation/domain/entities/geolocation_entity.dart';

import '../../../../../core/adapters/protocols/i_http_external.dart';

mixin IGeolocation {
  Future<void> save(GeolocationEntity geolocationEntity);
}

class GeolocationApi implements IGeolocation {
  IHttp iHttp;

  GeolocationApi({
    required this.iHttp,
  });

  @override
  Future<void> save(GeolocationEntity geolocationEntity) async {
    try {
      log(geolocationEntity.toJson());
      // await iHttp.postHttp(
      //   '${env['URL_BASE']}/geolocation',
      //   body: geolocationEntity.toJson(),
      // );
    } catch (e) {
      throw ApiException(error: ApiMensages.GENERIC_ERROR);
    }
  }
}
