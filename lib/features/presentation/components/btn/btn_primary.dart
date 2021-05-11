import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BtnPrimary extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const BtnPrimary({
    Key? key,
    required this.label,
    required this.onPressed,
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
                Get.theme.buttonColor,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            child: Text(
              label,
              style: const TextStyle(
                letterSpacing: 1,
                color: Color(0xffffffff),
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
