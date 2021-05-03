import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_invoice_external.dart';
import 'package:t_truck_app/features/data/models/Invoice_model.dart';
import 'package:t_truck_app/features/domain/entites/invoice.dart';

class InvoiceExternalApi implements IInvoiceExternal {
  final IHttp iHttp;

  InvoiceExternalApi({
    required this.iHttp,
  });

  @override
  Future<List<Invoice>> list() async {
    try {
      var res = await iHttp.getHttp('${env['URL_BASE']}/invoice');
      List list = jsonDecode(res.body!);
      return list.map((e) => InvoiceModel.fromMap(e)).toList();
    } catch (e) {
      throw ApiException(error: ApiMensages.INVOICE_LIST_ERROR);
    }
  }
}
