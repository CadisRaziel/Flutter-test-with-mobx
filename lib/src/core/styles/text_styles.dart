import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;
  TextStyles._();

  static TextStyles get instanceTextStyles {
    _instance ??= TextStyles._();
    return _instance!;
  }

  TextStyle get textLight => const TextStyle(
        fontWeight: FontWeight.normal,
      );
}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.instanceTextStyles;
}
