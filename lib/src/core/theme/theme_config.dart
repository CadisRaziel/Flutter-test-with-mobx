import 'package:flutter/material.dart';
import 'package:prova_flutter/src/core/styles/colors_app.dart';
import 'package:prova_flutter/src/core/styles/text_styles.dart';

class ThemeConfig {
  ThemeConfig._();

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(
      color: Colors.grey[400]!,
    ),
  );

  static final theme = ThemeData(
    
    scaffoldBackgroundColor: Colors.white,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    primaryColor: ColorsApp.instanceColor.primary,


    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.instanceColor.primary,
      primary: ColorsApp.instanceColor.primary,
      secondary: ColorsApp.instanceColor.secondary,
    ),
  
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(16),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle: TextStyles.instanceTextStyles.textLight.copyWith(
        color: Colors.black,
      ),
      errorStyle: TextStyles.instanceTextStyles.textLight.copyWith(
        color: Colors.redAccent,
        fontSize: 14,
      ),
    ),
  );
}
