import 'package:flutter/material.dart';

class LayoutForm extends StatelessWidget {
  final Widget child;

  const LayoutForm({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .868,
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
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * .064,
              ),
              child: child,
            );
          },
        ),
      ),
    );
  }
}
