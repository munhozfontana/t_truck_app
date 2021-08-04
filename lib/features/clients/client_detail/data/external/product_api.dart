import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../../core/adapters/protocols/i_http_external.dart';
import '../../../../../core/error/api_exception.dart';
import '../../../../../core/messages/api_mensages.dart';
import '../../../list_clients/data/models/payment_type_gsa.dart';
import '../../../list_products/data/models/product_model.dart';

mixin IProduct {
  Future<Tuple3<List<ProductModel>, List<PaymentTypeGSA>, bool>> getId(
      int codCli);
}

class ProductApi implements IProduct {
  final IHttp iHttp;

  ProductApi({
    required this.iHttp,
  });

  @override
  Future<Tuple3<List<ProductModel>, List<PaymentTypeGSA>, bool>> getId(
      int codCli) async {
    try {
      var resPayments = await _getPaymentType(codCli);
      var listProductsModel = await _getProducts(resPayments.value1);
      return Tuple3(listProductsModel, resPayments.value1, resPayments.value2);
    } catch (e) {
      throw ApiException(error: ApiMensages.GENERIC_ERROR);
    }
  }

  Future<Tuple2<List<PaymentTypeGSA>, bool>> _getPaymentType(int codCli) async {
    var resPaymentType = await iHttp.postHttp(
      '${env['URL_BASE']}/paymentType',
      body: {'CODCLIE': codCli},
    );

    var decode = json.decode(resPaymentType.body!);

    var listProduct = (decode['tipopagamento'] as List)
        .map(
          (e) => PaymentTypeGSA.fromMap(e),
        )
        .toList();
    return Tuple2(listProduct, decode['jump']);
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
      },
    ).toList();
    return listProductsModel;
  }
}
