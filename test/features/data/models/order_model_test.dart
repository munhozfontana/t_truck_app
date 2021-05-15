import 'package:flutter_test/flutter_test.dart';
import 'package:t_truck_app/core/utils/payment_utils.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';

void main() {
  test('shoud', () {
    var listIdenticacoes = <TransacaoVenda>[
      TransacaoVenda(numTransVenda: 1, numNota: 1, valor: 5000),
      TransacaoVenda(numTransVenda: 1, numNota: 1, valor: 154123.561),
      TransacaoVenda(numTransVenda: 1, numNota: 1, valor: 12.662),
    ];

    var orderEntity =
        OrderEntity(cliente: '', codCli: 1, identificacoes: listIdenticacoes);
    var result = PaymentUtils.valorTotalFromOrder(orderEntity);

    expect(result, 15913622);
  });
}
