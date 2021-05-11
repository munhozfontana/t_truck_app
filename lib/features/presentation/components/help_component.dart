import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpComponent extends StatelessWidget {
  const HelpComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: Container(
            width: constraints.maxWidth,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                      style: Get.textTheme.headline4,
                      text:
                          'Precisa de ajuda? Entre em contato \ncom o telefone '),
                  TextSpan(
                    style: Get.textTheme.headline5,
                    text: ' (00) 0 0000-0000',
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
