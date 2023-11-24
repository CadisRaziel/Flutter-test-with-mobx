import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  ///extensão para descobrir o tamanho da tela
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  ///extensão para descobrir porcentagem da tela
  double percentWidth(double percent) => screenWidth * percent;
  double percentHeight(double percent) => screenHeight * percent;
}
