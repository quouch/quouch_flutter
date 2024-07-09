import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton(
      {this.iconData,
      this.onPressed,
      this.iconColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.iconSize = 24,
      this.radius = 36,
      super.key});
  final IconData? iconData;
  final Function? onPressed;
  // Defaults to 36. This value should be larger than [iconSize]
  final double radius;
  // Defaults to 24. This value should be smaller than [radius]
  final double iconSize;
  final Color? iconColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed as void Function()?,
      color: iconColor,
      padding: EdgeInsets.zero,
      splashRadius: 24,
      iconSize: iconSize,
      icon: Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Icon(
          iconData,
        ),
      ),
    );
  }
}
