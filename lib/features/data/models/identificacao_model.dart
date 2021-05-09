import 'package:t_truck_app/features/domain/entites/order_entity.dart';

class IdentificacaoModel extends Identificacao {
  IdentificacaoModel({
    required int numTransVenda,
    required int numNota,
  }) : super(numTransVenda: numTransVenda, numNota: numNota);
}
