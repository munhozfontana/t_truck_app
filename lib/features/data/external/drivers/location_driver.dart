import 'package:geolocator/geolocator.dart' as geo_driver;
import 'package:t_truck_app/core/error/driver_exception.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_location.dart';

class LocationDriver implements ILocation {
  GeolocatorAdapterHelper geolocatorAdapterHelper;

  LocationDriver({
    required this.geolocatorAdapterHelper,
  });

  @override
  Future<LocationResponse> getCurrentPosition() async {
    try {
      var res = await geolocatorAdapterHelper.getCurrentPosition();
      return LocationResponse(
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
