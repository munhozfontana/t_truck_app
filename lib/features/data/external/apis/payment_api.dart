import 'package:t_truck_app/features/data/external/adapters/i_http_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_payment_external.dart';

class PaymentApi {
  final IHttp iHttp;

  PaymentApi({
    required this.iHttp,
  });

  Future<void> pay(List<OrderDatabaseEntity> listOrderEntity) async {
    await iHttp.postHttp('https://320002faa266.ngrok.io/api/payment',
        body: OrderDatabaseEntity(
          numtransvenda: 97319292,
          prest: '1',
          codcob: 'CREDITO',
          codcoborig: 'A VISTA',
          valor: 1009866,
          presttef: 0,
          nsutef: '530452',
          codautorizacaotef: '53234',
          codadmcartao: '00225',
          tipooperacaotef: '4',
          valorjuros: 0,
          idtransacao: '90a91928-b384-11eb-8529-0242ac130003',
          conector: 'CIELO',
          JSON_CIELO: '[Lob]',
          codbandeira: 1,
          data_desd: '03/05/2003 21:02:44',
          exportado: null,
          data_pagamento: '03/05/2003 21:02:44',
        ).toJson());
  }
}
