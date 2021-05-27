import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final double? size;
  final double? iconSize;
  final Color? selectedColor;
  final Color? selectedIconColor;
  final bool isSelected;
  final Function onTap;

  CustomCheckbox({
    this.size,
    this.iconSize,
    this.selectedColor,
    this.selectedIconColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            )),
        width: size ?? 24,
        height: size ?? 24,
        child: isSelected
            ? Icon(
                Icons.check,
                color: selectedIconColor ?? Colors.grey,
                size: iconSize ?? 20,
              )
            : null,
      ),
    );
  }
}
