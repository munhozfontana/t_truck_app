import 'package:t_truck_app/features/data/models/identificacao_model.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel(
      {required String? dtCanhato,
      required String cliente,
      required int codCli,
      required List<IdentificacaoModel> identificacao})
      : super(
            dtCanhato: dtCanhato,
            cliente: cliente,
            codCli: codCli,
            identificacoes: identificacao);

  static List<OrderModel> orderByIdentificacao(List list) {
    return list.map((order) {
      var identificacao = list
          .where(
            (element) => element['CODCLI'] == order['CODCLI'],
          )
          .map((e) => IdentificacaoModel(
              numTransVenda: e['NUMTRANSVENDA'], numNota: e['NUMTRANSVENDA']))
          .toList();

      return OrderModel(
          dtCanhato: order['DTCANHOTO'],
          cliente: order['CLIENTE'],
          codCli: order['CODCLI'],
          identificacao: identificacao);
    }).toList();
  }
}
