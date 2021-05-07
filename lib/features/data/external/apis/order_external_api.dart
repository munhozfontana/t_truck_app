import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_order_external.dart';
import 'package:t_truck_app/features/data/models/order_model.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';

class OrderExternalApi implements IOrderExternal {
  final IHttp iHttp;

  OrderExternalApi({
    required this.iHttp,
  });

  @override
  Future<List<OrderEntity>> list() async {
    try {
      var res = await iHttp.getHttp('${env['URL_BASE']}/order');
      List list = jsonDecode(res.body!);
      return list.map((e) => OrderModel.fromMap(e)).toList();
    } catch (e) {
      throw ApiException(error: ApiMensages.Order_LIST_ERROR);
    }
  }
}
