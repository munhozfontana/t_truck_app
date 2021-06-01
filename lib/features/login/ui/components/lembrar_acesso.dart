import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/components/custom_checkbox.dart';

class LembrarAcesso extends StatelessWidget {
  const LembrarAcesso({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CustomCheckbox(
            isSelected: false,
            onTap: () {},
          ),
        ),
        Text(
          'Lembrar acesso',
          style: Get.textTheme.headline3,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
