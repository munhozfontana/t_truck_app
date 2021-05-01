import 'package:get/get.dart';

String? fieldNotBlank(value) {
  print(value);
  if (GetUtils.isBlank(value)!) {
    return 'Campo obrigatório';
  }
  return null;
}
