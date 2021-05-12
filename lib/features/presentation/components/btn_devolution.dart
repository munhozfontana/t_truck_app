import 'package:flutter/material.dart';

enum TypeDevolution { GREEN, YELLOW, RED, NONE }

class BtnDevolution extends StatelessWidget {
  final TypeDevolution typeDevolution;
  final String label;
  final Function onTap;

  const BtnDevolution({
    Key? key,
    required this.typeDevolution,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  Color colorButton() {
    if (typeDevolution == TypeDevolution.GREEN) {
      return Color(0xff2fe080);
    }
    if (typeDevolution == TypeDevolution.YELLOW) {
      return Color(0xffefa92e).withOpacity(0.10000000149011612);
    }
    if (typeDevolution == TypeDevolution.RED) {
      return Color(0xfffd5858).withOpacity(0.10000000149011612);
    }

    return Color(0xff2fe080);
  }

  Color colorTextButton() {
    if (typeDevolution == TypeDevolution.GREEN) {
      return Color(0xffffffff);
    }
    if (typeDevolution == TypeDevolution.YELLOW) {
      return Color(0xffefa92e);
    }
    if (typeDevolution == TypeDevolution.RED) {
      return Color(0xfffd5858);
    }

    return Color(0xff2fe080);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(children: [
            Container(
              width: constraints.maxWidth,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: colorButton(),
              ),
            ),
            Container(
              height: 56,
              child: Center(
                child: Text(label,
                    style: TextStyle(
                        color: colorTextButton(),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                    textAlign: TextAlign.center),
              ),
            )
          ]);
        },
      ),
    );
  }
}
