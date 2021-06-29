import 'dart:convert';

class GeolocationEntity {
  final double? latitude;
  final double? longitude;

  GeolocationEntity({this.latitude, this.longitude});

  @override
  String toString() =>
      'GeolocationEntity(latitude: $latitude, longitude: $longitude)';

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude!.toStringAsFixed(7),
      'longitude': longitude!.toStringAsFixed(7),
    };
  }

  factory GeolocationEntity.fromMap(Map<String, dynamic> map) {
    return GeolocationEntity(
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GeolocationEntity.fromJson(String source) =>
      GeolocationEntity.fromMap(json.decode(source));
}
