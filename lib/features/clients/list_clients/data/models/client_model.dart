import 'dart:convert';

import 'package:t_truck_app/features/clients/list_clients/domain/entites/receipt_model.dart';

import '../../../../../core/utils/payment_utils.dart';
import '../../../../payment/data/external/channels/cielo_channel.dart';
import '../../../list_products/data/models/payment_type_gsa.dart';
import '../../../list_products/data/models/product_model.dart';
import '../../domain/entites/client_entity.dart';

class ClientModel extends ClientEntity {
  @override
  final String id;
  @override
  final int clientId;
  @override
  final String name;
  @override
  final int qtde;
  @override
  final bool show;
  @override
  final List<ProductModel> produtos;
  final List<ReceipModel> receipts;

  final int codCli;

  List<PaymentTypeGSA>? paymentTypeGsa;

  ClientModel({
    this.id = '',
    this.clientId = 0,
    this.name = '',
    this.qtde = 0,
    this.show = true,
    this.produtos = const [],
    this.receipts = const [],
    this.codCli = 0,
    this.paymentTypeGsa,
  });

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      produtos: <ProductModel>[],
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
    int? clientId,
    String? name,
    int? qtde,
    bool? show,
    List<ProductModel>? produtos,
    List<ReceipModel>? receipts,
    int? codCli,
    List<PaymentTypeGSA>? paymentTypeGsa,
  }) {
    return ClientModel(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
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
