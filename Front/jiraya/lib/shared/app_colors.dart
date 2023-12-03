import 'package:flutter/material.dart';

abstract class AppColors {
  static Color  primaryColor(BuildContext _) => Theme.of(_).colorScheme.primary;
  static Color  secondaryColor(BuildContext _) => Theme.of(_).colorScheme.secondary;
  static Color  backgroundColor(BuildContext _) => Theme.of(_).colorScheme.background;
}
