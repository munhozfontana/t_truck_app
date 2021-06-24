import 'package:geolocator/geolocator.dart' as geo_driver;
import 'package:t_truck_app/features/geolocation/domain/entities/geolocation_entity.dart';

import '../../error/driver_exception.dart';
import '../../messages/api_mensages.dart';
import '../protocols/i_location_external.dart';

class LocationDriver implements ILocation {
  GeolocatorAdapterHelper geolocatorAdapterHelper;

  LocationDriver({
    required this.geolocatorAdapterHelper,
  });

  @override
  Future<GeolocationEntity> getCurrentPosition() async {
    try {
      var res = await geolocatorAdapterHelper.getCurrentPosition();
      return GeolocationEntity(
        latitude: res.latitude,
        longitude: res.longitude,
      );
    } catch (e) {
      throw DriverException(error: ApiMensages.LOCATION_ERROR);
    }
  }
}

class GeolocatorAdapterHelper {
  Future<geo_driver.Position> getCurrentPosition() =>
      geo_driver.Geolocator.getCurrentPosition(
        desiredAccuracy: geo_driver.LocationAccuracy.high,
      );
}
