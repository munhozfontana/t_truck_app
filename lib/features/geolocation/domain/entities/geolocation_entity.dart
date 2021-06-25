class GeolocationEntity {
  final double? latitude;
  final double? longitude;

  GeolocationEntity({this.latitude, this.longitude});

  @override
  String toString() =>
      'GeolocationEntity(latitude: $latitude, longitude: $longitude)';
}
