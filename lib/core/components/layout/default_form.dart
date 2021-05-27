import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum LayoutSize { SMALL, MEDIUM, BIG, BIG_NO_PADDING_BUTTOM }

extension LayoutSizeUtils on LayoutSize {
  double get hight {
    switch (this) {
      case LayoutSize.SMALL:
        return .66;
      case LayoutSize.MEDIUM:
        return .75;
      case LayoutSize.BIG:
        return .868;
      case LayoutSize.BIG_NO_PADDING_BUTTOM:
        return .868;
      default:
        return .85;
    }
  }
}

class DefaultForm extends StatelessWidget {
  final List<Widget>? children;
  final Widget Function(BuildContext context, BoxConstraints constraints)?
      builder;
  final LayoutSize layoutSize;

  final EdgeInsetsGeometry? padding;

  const DefaultForm({
    Key? key,
    this.children,
    this.layoutSize = LayoutSize.BIG,
    this.padding,
    this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints cons) {
          var defaultValue = cons.maxWidth * .064;
          return Container(
            padding: GetUtils.isNull(padding)
                ? EdgeInsets.only(
                    left: defaultValue,
                    right: defaultValue,
                    top: defaultValue,
                    bottom: LayoutSize.BIG_NO_PADDING_BUTTOM == layoutSize
                        ? 0
                        : defaultValue,
                  )
                : padding,
            width: cons.maxWidth,
            height: cons.maxHeight * layoutSize.hight,
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
            child: GetUtils.isNull(builder)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children!)
                : builder!(context, cons),
          );
        },
      ),
    );
  }
}
