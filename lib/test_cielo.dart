import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_truck_app/core/utils/payment_utils.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_channel.dart';

class TestCielo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var credentials = PaymentUtils.buildCieloCredentials();

          var arg = PayParam()
            ..reference = 'GSA'
            ..cieloCredentials = credentials
            ..items = [
              {
                'sku': 'c2f5fb9a-5542-406e-8b79-17892329cda8',
                'name': 'produto fake 1',
                'unitPrice': 1,
                'quantity': 1,
                'unitOfMeasure': 'EACH',
              },
              {
                'sku': 'c2f5fb9a-5542-406e-8b79-17892329cda2',
                'name': 'produto fake 2',
                'unitPrice': 1,
                'quantity': 1,
                'unitOfMeasure': 'EACH',
              },
              {
                'sku': 'c2f5fb9a-5542-406e-8b79-17892329cda4',
                'name': 'produto fake 3',
                'unitPrice': 1,
                'quantity': 1,
                'unitOfMeasure': 'EACH',
              },
            ];
          // CieloDriver().payCielo(arg).then((value) =>
          //     AppDialog.show(titulo: 'Android', menssagem: value.id));
          ;
        },
      ),
    );
  }
}
