import 'package:flutter_dotenv/flutter_dotenv.dart' as dont_env;
import 'package:flutter_test/flutter_test.dart';
import 'package:t_truck_app/features/data/models/order_model.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await dont_env.load(fileName: '.env');
  });

  test('verify value correct to cielo', () {
    var identificacoes = <TransacaoVenda>[
      TransacaoVenda(numTransVenda: 1, numNota: 2, valor: 6321.15),
      TransacaoVenda(numTransVenda: 2, numNota: 3, valor: 512.52),
      TransacaoVenda(numTransVenda: 2, numNota: 3, valor: 51.57),
    ];

    var listOrderEntity = <OrderEntity>[
      OrderEntity(
          cliente: 'cliente',
          codCli: 1,
          dtCanhato: 'dyCanhato',
          identificacoes: identificacoes)
    ];

    var res = OrderModel.orderToCielo(listOrderEntity);

    expect(res.valorTotal, 688524);
    expect((res.items as List<Map>)[0]['unitPrice'], 632115);
    expect((res.items as List<Map>)[1]['unitPrice'], 51252);
    expect((res.items as List<Map>)[2]['unitPrice'], 5157);
  });
}
