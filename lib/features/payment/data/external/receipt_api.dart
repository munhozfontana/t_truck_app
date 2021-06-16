import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_truck_app/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/clients/list_products/data/models/product_receipt_model.dart';

mixin IReceiptExternal {
  Future<void> save(List<ProductReceiptModel> list);
}

class ReceiptApi implements IReceiptExternal {
  final IHttp iHttp;

  ReceiptApi({
    required this.iHttp,
  });

  @override
  Future<void> save(List<ProductReceiptModel> list) async {
    try {
      await iHttp.postHttp(
        '${env['URL_BASE']}/product',
        body: ProductReceiptModel.listToJson(list),
      );
    } catch (e) {
      throw ApiException(error: ApiMensages.GENERIC_ERROR);
    }
  }
}
