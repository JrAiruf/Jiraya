import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.icon,
    this.elevation,
    this.radius,
    required this.onTap,
    required this.primaryColor,
    required this.height,
    required this.width,
    this.text,
    this.showBorder,
    this.backgroundColor,
  });

  final IconData? icon;
  final Function() onTap;
  final Color primaryColor;
  final Color? backgroundColor;
  final String? text;
  final bool? showBorder;
  final double? elevation;
  final double? radius;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          elevation: elevation,
          backgroundColor: backgroundColor ?? Colors.white,
          side: showBorder ?? false ? BorderSide(color: primaryColor, width: 0.7) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 15),
          ),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null ? Icon(icon, color: primaryColor) : Container(),
            icon != null ? SizedBox(width: width * 0.02) : Container(),
            Text(
              text ?? "",
              style: TextStyle(color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
