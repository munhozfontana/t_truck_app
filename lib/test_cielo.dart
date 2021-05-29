import 'dart:async';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_channel.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_driver.dart';

class TestCielo extends StatefulWidget {
  @override
  _TestCieloState createState() => _TestCieloState();
}

class _TestCieloState extends State<TestCielo> {
  var onClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: onClick
            ? null
            : () async {
                setState(() {
                  onClick = true;
                });

                var credentials = CieloCredentials()
                  ..accessToken = 'asdasd'
                  ..clientID = 'asdasdasd';

                var arg = PayParam()
                  ..reference = 'GSA'
                  ..cieloCredentials = credentials
                  ..sku = 'c2f5fb9a-5542-406e-8b79-17892329cda8'
                  ..description = 'produto fake'
                  ..unit_of_measure = 'EACH'
                  ..quantity = 1
                  ..unit_price = 1;
                CieloDriver().payCielo(arg);

                Timer(
                    Duration(seconds: 5),
                    () => {
                          setState(() {
                            onClick = false;
                          })
                        });
              },
      ),
    );
  }
}
