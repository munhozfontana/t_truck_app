import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info/package_info.dart';

import '../../../core/components/app_background.dart';

class Splash extends StatelessWidget {
  final PackageInfo? packageInfo;

  const Splash({
    Key? key,
    this.packageInfo,
  }) : super(key: key);

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
          Visibility(
              maintainSize: false,
              maintainState: false,
              visible: packageInfo != null,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                    '${packageInfo?.version} - ${packageInfo?.buildNumber}'),
              )),
          Container(
            child: Center(
              child: SvgPicture.asset(
                'images/logo.svg',
                semanticsLabel: 'Background Logo',
                height: 60,
              ),
            ),
          )
        ],
      ),
    );
  }
}
