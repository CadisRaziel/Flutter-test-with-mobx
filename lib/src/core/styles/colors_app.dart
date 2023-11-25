import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;
  ColorsApp._();

  static ColorsApp get instanceColor {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get backgroundLinearOne => const Color.fromARGB(255, 1, 54, 45);
  Color get backgroundLinearTwo => const Color.fromARGB(255, 0, 137, 123);
  Color get backgroundLinearThree => const Color.fromARGB(255, 77, 182, 172);
  Color get primary => Colors.teal[700]!;
  Color get secondary => Colors.black;
  Color get textAux => Colors.white;
  Color get buttonHomePage => Colors.green;
}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colors => ColorsApp.instanceColor;
}
