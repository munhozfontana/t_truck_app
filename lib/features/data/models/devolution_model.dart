import 'package:intl/intl.dart';
import 'package:t_truck_app/features/domain/entites/devolution_entity.dart';

class DevolutionModel extends DevolutionEntity {
  DevolutionModel({
    required productEntity,
    required transacaoVendaEntity,
    required orderEntity,
    required situacao,
    required date,
    required codmot,
  }) : super(
          productEntity: productEntity,
          orderEntity: orderEntity,
          situacao: situacao,
          date: date,
          codmot: codmot,
        );

  static Map<String, Object> toJson(DevolutionEntity devolutionEntity) {
    return {
      'codprod': devolutionEntity.productEntity.codProd,
      'qt': devolutionEntity.productEntity.qtToSend.toString(),
      'situacao': devolutionEntity.situacao,
      'data':
          DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now()).toString(),
      'codcli': devolutionEntity.orderEntity.codCli,
      'numtransvenda':
          devolutionEntity.productEntity.transacaoVendaEntity.numTransVenda,
      'codmot': devolutionEntity.codmot,
    };
  }
}
