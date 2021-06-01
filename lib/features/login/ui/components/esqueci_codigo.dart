import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class EsqueciCodigo extends StatelessWidget {
  final BoxConstraints constraints;

  const EsqueciCodigo({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21,
      width: constraints.maxWidth,
      child: Text(
        'Esqueci meu código',
        style: Get.textTheme.headline4,
        textAlign: TextAlign.center,
      ),
    );
  }
}
