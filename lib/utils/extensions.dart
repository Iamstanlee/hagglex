import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  /// return the height of ``this`` context with a factor from ``0.1 - 1``
  ///
  /// for example a factor of ``0.5`` returns half the height of the context
  double getHeight({double factor = 1}) {
    assert(factor != null && factor != 0);
    return MediaQuery.of(this).size.height * factor;
  }

  /// return the width of ``this`` context with a factor from ``0.1 - 1``
  /// for example a factor of ``0.5`` returns half the width of the context
  double getWidth({double factor = 1}) {
    assert(factor != null && factor != 0);
    return MediaQuery.of(this).size.width * factor;
  }
}

extension StrExtension on String {

  int toInt() {
    assert(this != null && this is! num);
    return int.parse(this);
  }

}