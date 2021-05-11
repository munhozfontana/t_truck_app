import 'package:flutter/material.dart';

class DefaultForm extends StatelessWidget {
  final List<Widget> child;

  const DefaultForm({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight * .66,
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(8, 14, 49, 0.12),
                  spreadRadius: 5,
                  blurRadius: 32,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * .064,
              ),
              child: Column(children: child),
            ),
          );
        },
      ),
    );
  }
}
