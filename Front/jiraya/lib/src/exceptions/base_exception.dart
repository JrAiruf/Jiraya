import 'package:flutter/material.dart';

abstract class BaseException implements Exception {
  final String message;

  BaseException(this.message) {
    showMessage(message);
  }

  void showMessage(String message) {
    FlutterError.presentError(FlutterErrorDetails(exception: message));
  }
}
