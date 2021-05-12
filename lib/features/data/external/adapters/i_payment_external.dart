import 'package:t_truck_app/features/domain/entites/order_entity.dart';

abstract class IPaymentExternal {
  Future<PaymentResponse> pay(List<OrderEntity> listOrderEntity);
}

class PaymentResponse {
  int? status;
  List<Object?>? payments;
  PaymentResponse({
    this.status,
    this.payments,
  });
}
