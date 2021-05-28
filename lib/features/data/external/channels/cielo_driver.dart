import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_channel.dart';

class CieloDriver {
  Future<PayResponse> payCielo(PayParam payParam) async {
    var pay = await CieloRun().pay(payParam);

    await showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("ERROR"),
          content: new Text(pay.error == null ? "sem nada" : pay.error),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    print(pay);

    // if (GetUtils.isNull(pay.id)) {
    //   throw DriverException();
    // }

    return pay;

    // try {

    // } catch (e) {
    //   throw DriverException();
    // }
  }
}
