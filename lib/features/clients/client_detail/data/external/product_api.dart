import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../../core/adapters/protocols/i_http_external.dart';
import '../../../list_products/data/models/payment_type_gsa.dart';
import '../../../list_products/domain/entites/product_entity.dart';

mixin IProduct {
  Future<List<ProductEntity>> getId(int codCli);
}

class ProductApi implements IProduct {
  final IHttp iHttp;

  ProductApi({
    required this.iHttp,
  });

  @override
  Future<List<ProductEntity>> getId(int codCli) async {
    var resPaymentTypeGSA = await iHttp.postHttp(
      '${env['URL_BASE']}/paymentType',
      body: {'CODCLIE': codCli},
    );

    var list = (json.decode(resPaymentTypeGSA.body!) as List)
        .map(
          (e) => PaymentTypeGSA.fromMap(e),
        )
        .toList();

    return Future.value([]);
  }
}
