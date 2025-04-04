import 'package:flutter/material.dart';

import '../../core/constant.dart';


class AppBtnWidgets extends StatelessWidget {
  const AppBtnWidgets({
    super.key,
    required this.text,
    required this.onClick,
    this.backgroundColor = kButtonColor,
    this.borderColor = Colors.transparent,
    this.icon,
    this.textColor = Colors.white,
    this.width,
    this.elevation,
    this.gradient = kMainGradientColor,
    this.borderRadius = kRadiusControl,
  });

  final String text;

  final Color backgroundColor;
  final Widget? icon;
  final Function() onClick;
  final Color borderColor;
  final Color textColor;
  final double? width;
  final double? elevation;
  final double borderRadius;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      height: 54,
      width: width,
      child: icon == null
          ? ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: elevation ?? 0.1,
          padding:
          const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onClick,
        child: Text(
          text.toUpperCase(),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: textColor,
          ),
        ),
      )
          : ElevatedButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          elevation: elevation ?? 4,
          padding:
          const EdgeInsets.symmetric(horizontal: 16),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onClick,
        icon: icon!,
        label: Text(
          text.toUpperCase(),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
