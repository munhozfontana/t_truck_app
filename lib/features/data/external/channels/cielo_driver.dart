import 'package:t_truck_app/features/data/external/channels/cielo_channel.dart';

class CieloDriver {
  Future<PayResponse> payCielo(PayParam payParam) async {
    var pay = await CieloRun().pay(payParam);

    print(pay);

    // showDialog(
    //   context: Get.context!,
    //   builder76: (BuildContext context) {
    //     // return object of type Dialog
    //     return AlertDialog(
    //       title: new Text("ERROR"),
    //       content: new Text(pay.error == null ? "SEM ERROR" : pay.error!),
    //       actions: <Widget>[
    //         // usually buttons at the bottom of the dialog
    //         new FlatButton(
    //           child: new Text("Close"),
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //         ),
    //       ],
    //     );
    //   },
    // );

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
