import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_truck_app/core/utils/payment_utils.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_channel.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_driver.dart';
import 'package:t_truck_app/features/presentation/styles/app_dialog.dart';

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
            ..sku = 'c2f5fb9a-5542-406e-8b79-17892329cda8'
            ..description = 'produto fake'
            ..unit_of_measure = 'EACH'
            ..quantity = 1
            ..unit_price = 1;
          CieloDriver().payCielo(arg).then((value) =>
              AppDialog.show(titulo: 'Android', menssagem: value.id));
          ;
        },
      ),
    );
  }
}
