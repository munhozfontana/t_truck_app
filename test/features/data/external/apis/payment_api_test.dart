import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:t_truck_app/features/data/external/apis/payment_api.dart';
import 'package:t_truck_app/features/data/external/drivers/dio_driver.dart';

void main() {
  late PaymentApi paymentApi;

  setUp(() {
    paymentApi = PaymentApi(iHttp: DioDriver(dio: Dio()));
  });

  test('test', () async {
    // TODO: Do tests
  });
}
