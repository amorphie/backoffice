import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get height => MediaQuery.sizeOf(this).height;

  double get width => MediaQuery.sizeOf(this).width;
}

extension NullableContextExtensions on BuildContext? {
  void requireContext(Function(BuildContext) function) {
    if (this != null) {
      function(this!);
    }
  }
}
