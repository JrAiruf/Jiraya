import 'package:flutter/material.dart';

class AppElavatedButton extends StatelessWidget {
  const AppElavatedButton({
    super.key,
    this.icon,
    this.elevation,
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
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.06,
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          elevation: elevation,
          backgroundColor: backgroundColor ?? Colors.white,
          side: showBorder ?? false ? BorderSide(color: primaryColor, width: 0.7) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
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
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
