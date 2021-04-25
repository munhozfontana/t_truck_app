import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_app/core/error/driver_exception.dart';
import 'package:t_truck_app/features/data/external/drivers/location_driver.dart';

import 'location_driver_test.mocks.dart';

@GenerateMocks([GeolocatorAdapterHelper])
void main() {
  late LocationDriver locationDriver;
  late GeolocatorAdapterHelper mockGeolocatorAdapterHelper;

  setUp(() {
    mockGeolocatorAdapterHelper = MockGeolocatorAdapterHelper();
    locationDriver =
        LocationDriver(geolocatorAdapterHelper: mockGeolocatorAdapterHelper);
  });

  test('should return location user', () async {
    var valueMatcher = Position(
        longitude: 3,
        latitude: 3,
        timestamp: DateTime.now(),
        accuracy: 3,
        altitude: 3,
        heading: 3,
        speed: 50,
        speedAccuracy: 45);
    when(mockGeolocatorAdapterHelper.getCurrentPosition())
        .thenAnswer((realInvocation) async => valueMatcher);
    expect((await locationDriver.getCurrentPosition()).latitude,
        equals(valueMatcher.latitude));
    expect((await locationDriver.getCurrentPosition()).longitude,
        equals(valueMatcher.longitude));
  });
  test('should throws DriverExption with erros', () {
    when(mockGeolocatorAdapterHelper.getCurrentPosition()).thenThrow(Exception);
    expect(
      locationDriver.getCurrentPosition(),
      throwsA(isA<DriverException>()),
    );
  });
}
