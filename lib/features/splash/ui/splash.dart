import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/components/app_background.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform.rotate(
            angle: math.pi / 1,
            child: Stack(
              children: [
                AppBackground().backgroundGray(),
                AppBackground().backgroundDraw(),
              ],
            ),
          ),
          Container(
            child: Center(
                child: SvgPicture.asset(
              'images/logo.svg',
              semanticsLabel: 'Background Logo',
              height: 60,
            )),
          )
        ],
      ),
    );
  }
}
