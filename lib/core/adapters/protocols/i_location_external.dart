import 'package:t_truck_app/features/geolocation/domain/entities/geolocation_entity.dart';

abstract class ILocation {
  Future<GeolocationEntity> getCurrentPosition();
}
