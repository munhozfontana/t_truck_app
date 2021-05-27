import 'package:flutter/material.dart';

class BtnVoltar extends StatelessWidget {
  final void Function()? onTap;
  final String label;

  const BtnVoltar({
    Key? key,
    this.onTap,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.keyboard_arrow_left_rounded),
          Text(label,
              style: const TextStyle(
                  color: Color(0xff6c6c6c),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
              textAlign: TextAlign.left)
        ],
      ),
    );
  }
}
