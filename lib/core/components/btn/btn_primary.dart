import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BtnPrimary extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final bool outline;

  const BtnPrimary({
    Key? key,
    required this.label,
    required this.onPressed,
    this.outline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            width: constraints.maxWidth,
            height: 56,
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                outline
                    ? Colors.white
                    : (!GetUtils.isNull(onPressed)
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.5)),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            child: Text(
              label,
              style: TextStyle(
                letterSpacing: 1,
                color: outline ? Get.theme.primaryColor : Color(0xffffffff),
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                fontStyle: FontStyle.normal,
                fontSize: 23.0,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        );
      },
    );
  }
}
