import 'package:t_truck_app/features/data/models/receipt_model.dart';

mixin IReceiptExternal {
  Future<void> save(List<ReceiptModel> object);
}
