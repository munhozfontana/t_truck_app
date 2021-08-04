import 'package:flutter/material.dart';
import 'package:get/get.dart';

var timeToDisabled = Duration(seconds: 30);

class AppUtils {
  static void show({String? titulo, String? menssagem}) {
    Get.showSnackbar(GetBar(
      message: menssagem,
      duration: timeToDisabled,
      backgroundColor: Get.theme.primaryColor,
    ));
  }

  static void error({String? titulo, String? menssagem}) {
    Get.showSnackbar(
      GetBar(
        message: menssagem,
        duration: timeToDisabled,
        backgroundColor: Colors.red[300]!,
      ),
    );
  }

  static void diaolog({
    String titulo = 'Alerta',
    String menssagem =
        'Pagamento realizado via PIX ou Transferência! Confirme  o pagamento com a empresa ou solicite o comprovante do cliente e clique em PROSSEGUIR.',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    Get.defaultDialog(
      title: titulo,
      content: Text(
        menssagem,
        textAlign: TextAlign.justify,
      ),
      textConfirm: 'Proseguir',
      textCancel: 'Cancelar',
      onConfirm: onConfirm,
      onCancel: onCancel,
    );
  }
}
