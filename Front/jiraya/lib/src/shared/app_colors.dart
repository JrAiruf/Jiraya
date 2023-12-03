import 'package:flutter/material.dart';

abstract class AppColors {
  static Color redPColor(BuildContext _) => Theme.of(_).colorScheme.primary;
  static Color yellowSColor(BuildContext _) => Theme.of(_).colorScheme.secondary;
  static Color backgroundColor(BuildContext _) => Theme.of(_).colorScheme.background;
  static Color primaryContainerColor(BuildContext _) => Theme.of(_).colorScheme.primaryContainer;
  static Color surfaceColor(BuildContext _) => Theme.of(_).colorScheme.surface;
  static Color onSurfaceColor(BuildContext _) => Theme.of(_).colorScheme.onSurface;
}
