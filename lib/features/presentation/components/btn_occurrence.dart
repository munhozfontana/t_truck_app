import 'package:flutter/material.dart';

enum TypeOccurrence { GREEN, YELLOW, RED, NONE }

class BtnOccurrence extends StatelessWidget {
  final TypeOccurrence typeOccurrence;
  final String label;
  final Function onTap;

  const BtnOccurrence({
    Key? key,
    required this.typeOccurrence,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  Color colorButton() {
    if (typeOccurrence == TypeOccurrence.GREEN) {
      return Color(0xff2fe080);
    }
    if (typeOccurrence == TypeOccurrence.YELLOW) {
      return Color(0xffefa92e).withOpacity(0.10000000149011612);
    }
    if (typeOccurrence == TypeOccurrence.RED) {
      return Color(0xfffd5858).withOpacity(0.10000000149011612);
    }

    return Color(0xff2fe080);
  }

  Color colorTextButton() {
    if (typeOccurrence == TypeOccurrence.GREEN) {
      return Color(0xffffffff);
    }
    if (typeOccurrence == TypeOccurrence.YELLOW) {
      return Color(0xffefa92e);
    }
    if (typeOccurrence == TypeOccurrence.RED) {
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
