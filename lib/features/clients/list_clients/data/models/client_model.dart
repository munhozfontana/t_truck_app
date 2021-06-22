import 'dart:convert';

import '../../../../../core/utils/payment_utils.dart';
import '../../../../payment/data/external/channels/cielo_channel.dart';
import '../../../list_products/data/models/product_model.dart';
import '../../../list_products/data/models/product_receipt_model.dart';
import '../../domain/entites/client_entity.dart';
import 'payment_type_gsa.dart';

class ClientModel extends ClientEntity {
  final List<ProductReceiptModel> receipts;
  final int codCli;
  List<PaymentTypeGSA>? paymentTypeGsa;

  ClientModel({
    String name = '',
    int qtde = 0,
    bool show = true,
    List<ProductModel> produtos = const <ProductModel>[],
    this.receipts = const [],
    this.codCli = 0,
    this.paymentTypeGsa,
  }) : super(
          name: name,
          produtos: produtos,
          qtde: qtde,
          show: show,
        );

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      codCli: map['CODCLI'],
      name: map['CLIENTE'],
      qtde: map['QTDE'],
    );
  }

  factory ClientModel.fromJson(String source) =>
      ClientModel.fromMap(json.decode(source));

  static PayParam orderToCielo(ClientModel? clientEntity) {
    var cieloCredentials = PaymentUtils.buildCieloCredentials();
    return PaymentUtils.buildPayParam(
        cieloCredentials,
        PaymentUtils.takeItems(
          clientEntity!,
        ));
  }

  ClientModel copyWith({
    String? id,
    String? name,
    int? qtde,
    bool? show,
    List<ProductModel>? produtos,
    List<ProductReceiptModel>? receipts,
    int? codCli,
    List<PaymentTypeGSA>? paymentTypeGsa,
  }) {
    return ClientModel(
      name: name ?? this.name,
      qtde: qtde ?? this.qtde,
      show: show ?? this.show,
      produtos: produtos ?? this.produtos,
      receipts: receipts ?? this.receipts,
      codCli: codCli ?? this.codCli,
      paymentTypeGsa: paymentTypeGsa ?? this.paymentTypeGsa,
    );
  }
}
