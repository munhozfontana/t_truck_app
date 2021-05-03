import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:t_truck_app/features/data/external/adapters/i_map_external.dart';

class Map implements IMap {
  Set<Polygon> list = <Polygon>{};
  late GoogleMapController googleMapController;

  void onMapCreate(GoogleMapController controller) async {
    googleMapController = controller;
    await googleMapController
        .setMapStyle(await rootBundle.loadString('assets/map_style.txt'));
  }

  @override
  Widget getMap() {
    return GoogleMap(
      onTap: print,
      polygons: list,
      onMapCreated: onMapCreate,
      initialCameraPosition: CameraPosition(
        target: LatLng(
          37.42796133580664,
          -122.085749655962,
        ),
        zoom: 16,
      ),
    );
  }
}
