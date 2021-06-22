import 'package:uuid/uuid.dart';

class BaseEntity {
  String id = Uuid().v4();
}
