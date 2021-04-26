import 'package:flutter/material.dart';

const kHorizontalPadding = 36.0;

class VSpacing {
  static const Widget xs = const SizedBox(height: 5);
  static const Widget sm = const SizedBox(height: 8);
  static const Widget md = const SizedBox(height: 16);
  static const Widget lg = const SizedBox(height: 24);
  static const Widget xl = const SizedBox(height: 32);
  static const Widget xxl = const SizedBox(height: 48);
}

class HSpacing {
  static const Widget xs = const SizedBox(width: 5);
  static const Widget sm = const SizedBox(width: 8);
  static const Widget md = const SizedBox(width: 16);
  static const Widget lg = const SizedBox(width: 24);
  static const Widget xl = const SizedBox(width: 36);
  static const Widget xxl = const SizedBox(width: 48);
}
