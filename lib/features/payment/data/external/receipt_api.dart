import '../../../../core/adapters/protocols/i_http_external.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../core/messages/api_mensages.dart';
import '../../../clients/list_products/data/models/product_receipt_model.dart';

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
      // await iHttp.postHttp(
      //   '${env['URL_BASE']}/product',
      //   body: ProductReceiptModel.listToJson(list),
      // );
      return Future.value();
    } catch (e) {
      throw ApiException(error: ApiMensages.GENERIC_ERROR);
    }
  }
}
