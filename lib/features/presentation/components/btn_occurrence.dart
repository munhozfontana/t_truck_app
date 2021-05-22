import 'package:flutter/material.dart';

enum TypeOccurrence { GREEN, YELLOW, RED, NONE }

class BtnOccurrence extends StatelessWidget {
  final TypeOccurrence typeOccurrence;
  final String label;
  final void Function()? onTap;

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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            width: constraints.maxWidth,
            height: 56,
          ),
          child: ElevatedButton(
            onPressed: onTap,
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(
                colorButton(),
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
                color: colorTextButton(),
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
