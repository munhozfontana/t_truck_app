import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_receipt_external.dart';
import 'package:t_truck_app/features/data/models/receipt_model.dart';

class ReceiptApi implements IReceiptExternal {
  final IHttp iHttp;

  ReceiptApi({
    required this.iHttp,
  });

  @override
  Future<void> save(List<ReceiptModel> list) async {
    try {
      // list.forEach((element) async {
      //   await iHttp.postHttp(
      //     '${env['URL_BASE']}/payment',
      //     body: element.toJson(),
      //   );
      // });
      await iHttp.postHttp(
        '${env['URL_BASE']}/canhoto',
        body: {'NUMTRANSVENDA': list.map((e) => e.numTransVenda).toList()},
      );

      return Future.value(null);
    } catch (e) {
      throw ApiException(error: ApiMensages.GENERIC_ERROR);
    }
  }
}
