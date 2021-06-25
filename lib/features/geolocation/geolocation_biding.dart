import 'package:get/get.dart';
import 'package:t_truck_app/core/adapters/drivers/location_driver.dart';
import 'package:t_truck_app/core/adapters/protocols/i_location_external.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/geolocation/data/repositories_impl/clients_repository.dart';
import 'package:t_truck_app/features/geolocation/domain/repositories/i_geolocation_repository.dart';
import 'package:t_truck_app/features/geolocation/domain/use_case/sync_geolocation_usecase.dart';

class GeolocationBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<ILocation>(
      LocationDriver(
        geolocatorAdapterHelper: GeolocatorAdapterHelper(),
      ),
      permanent: true,
    );

    Get.put<IGeolocationRepository>(
      GeolocationRepository(
        iLocation: Get.find(),
      ),
      permanent: true,
    );

    SyncGeolocationUseCase(
      geolocationRepository: Get.find(),
    ).call(Params());
  }
}
