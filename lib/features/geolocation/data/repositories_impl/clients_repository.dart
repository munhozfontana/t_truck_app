import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/adapters/protocols/i_location_external.dart';
import 'package:t_truck_app/core/error/driver_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/geolocation/domain/entities/geolocation_entity.dart';
import 'package:t_truck_app/features/geolocation/domain/repositories/i_geolocation_repository.dart';

class GeolocationRepository implements IGeolocationRepository {
  ILocation iLocation;

  GeolocationRepository({
    required this.iLocation,
  });

  @override
  Future<Either<Failure, GeolocationEntity>> getGeolocation() async {
    try {
      return Right(await iLocation.getCurrentPosition());
    } on DriverException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }

  @override
  Future<Either<Failure, void>> saveGeolocation(
      GeolocationEntity geolocationEntity) {
    // TODO: implement saveGeolocation
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> getAutorization() async {
    try {
      return Right(await iLocation.getAutorization());
    } on DriverException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
