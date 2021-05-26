import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_tipo_transacao_external.dart';
import 'package:t_truck_app/features/data/models/tipo_transacao_model.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/entites/tipo_transacao_entity.dart';

class TipoTransacaoApi implements ITipoTransacaoExternal {
  final IHttp iHttp;

  TipoTransacaoApi({
    required this.iHttp,
  });

  @override
  Future<List<TipoTransacaoEntity>> getByOrder(OrderEntity orderEntity) async {
    try {
      var res = await iHttp.postHttp(
        '${env['URL_BASE']}/reasons',
        body: {
          'CODCLI': orderEntity.codCli,
          'NUMCAR': orderEntity.numCar,
        },
      );

      return TipoTransacaoModel.fromJsonList(res.body!);
    } catch (e) {
      throw ApiException();
    }
  }
}
