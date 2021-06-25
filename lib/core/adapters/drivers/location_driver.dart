import 'package:geolocator/geolocator.dart';
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

  @override
  Future<bool> getAutorization() async {
    bool serviceEnabled;
    LocationPermission permission;
    permission = await Geolocator.checkPermission();

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }
}

class GeolocatorAdapterHelper {
  Future<Position> getCurrentPosition() {
    var geoResult = Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return geoResult;
  }
}
