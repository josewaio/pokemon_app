import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get _height => MediaQuery.of(this).size.height;

  double get _width => MediaQuery.of(this).size.width;

  double get margin => getWidth(.05);

  double getHeight([double factor = 1]) => 1 * _height * factor;

  double getWidth([double factor = 1]) => _width * factor;

}
