import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/geolocation/domain/entities/geolocation_entity.dart';

mixin IGeolocationRepository {
  Future<Either<Failure, GeolocationEntity>> getGeolocation();
  Future<Either<Failure, void>> saveGeolocation(
      GeolocationEntity geolocationEntity);
}
