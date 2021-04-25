import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_app/core/error/driver_exception.dart';
import 'package:t_truck_app/features/data/external/drivers/connectivity_plus_driver.dart';

import 'connectivity_plus_driver_test.mocks.dart';

@GenerateMocks([Connectivity])
void main() {
  late ConnectivityPlusDirver connectivityPlusDirver;
  late Connectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    connectivityPlusDirver = ConnectivityPlusDirver(
      connectivity: mockConnectivity,
    );
  });

  group('should return true when', () {
    test('is mobile', () async {
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.mobile);
      expect(await connectivityPlusDirver.isConnected(), isTrue);
    });

    test('is wifi', () async {
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);
      expect(await connectivityPlusDirver.isConnected(), isTrue);
    });
  });
  group('should return false when', () {
    test('is not wifi or mobile', () async {
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);
      expect(await connectivityPlusDirver.isConnected(), isFalse);
    });
  });

  test(
    'should throw DriverException when throws ane excption',
    () {
      when(mockConnectivity.checkConnectivity()).thenThrow(Exception);
      expect(connectivityPlusDirver.isConnected(),
          throwsA(isA<DriverException>()));
    },
  );
}
