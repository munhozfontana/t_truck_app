import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../../core/adapters/protocols/i_http_external.dart';
import '../../../list_products/data/models/payment_type_gsa.dart';
import '../../../list_products/data/models/product_model.dart';

mixin IProduct {
  Future<Tuple2<List<ProductModel>, List<PaymentTypeGSA>>> getId(int codCli);
}

class ProductApi implements IProduct {
  final IHttp iHttp;

  ProductApi({
    required this.iHttp,
  });

  @override
  Future<Tuple2<List<ProductModel>, List<PaymentTypeGSA>>> getId(
      int codCli) async {
    var resPayments = await _getPaymentType(codCli);
    var listProductsModel = await _getProducts(resPayments);
    return Tuple2(
      listProductsModel,
      resPayments,
    );
  }

  Future<List<PaymentTypeGSA>> _getPaymentType(int codCli) async {
    var resPaymentType = await iHttp.postHttp(
      '${env['URL_BASE']}/paymentType',
      body: {'CODCLIE': codCli},
    );

    var listProduct = (json.decode(resPaymentType.body!) as List)
        .map(
          (e) => PaymentTypeGSA.fromMap(e),
        )
        .toList();
    return listProduct;
  }

  Future<List<ProductModel>> _getProducts(
      List<PaymentTypeGSA> resPayments) async {
    var resProduct = await iHttp.postHttp(
      '${env['URL_BASE']}/product',
      body: {'NUMTRANSVENDA': resPayments.map((e) => e.numTransVenda).toList()},
    );

    var body = resProduct.body!;
    List list = json.decode(body);
    var listProductsModel = list.map(
      (e) {
        return ProductModel.fromMap(e);
        // ..paymentTypeGsa = resPayments.firstWhere(
        //     (element) => element.numTransVenda == e['NUMTRANSVENDA']);
      },
    ).toList();
    return listProductsModel;
  }
}
