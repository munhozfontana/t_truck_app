import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_product_external.dart';
import 'package:t_truck_app/features/data/models/product_model.dart';
import 'package:t_truck_app/features/data/models/transacao_venda_model.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/entites/product_entity.dart';

class ProductApi implements IProductExternal {
  final IHttp iHttp;

  ProductApi({
    required this.iHttp,
  });

  @override
  Future<List<ProductEntity>> list(List<TransacaoVenda> list) async {
    try {
      var res = await iHttp.postHttp('${env['URL_BASE']}/product',
          body: TransacaoVendaModel.toMapTransVenda(list));
      return ProductModel.listFromJson(res.body);
    } catch (e) {
      throw ApiException(error: ApiMensages.GENERIC_ERROR);
    }
  }
}
