import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class UIHelper {
  static final Logger _logger = Logger();

  static void logScreenSize(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    _logger.i('Screen Width: $width, Screen Height: $height');
  }
}
