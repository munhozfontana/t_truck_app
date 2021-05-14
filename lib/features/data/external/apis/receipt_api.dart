import 'package:t_truck_app/features/data/external/adapters/i_receipt_external.dart';
import 'package:t_truck_app/features/data/models/receipt_model.dart';

class ReceiptApi implements IReceiptExternal {
  @override
  Future<void> save(List<ReceiptModel> object) {
    return Future.value();
  }
}
