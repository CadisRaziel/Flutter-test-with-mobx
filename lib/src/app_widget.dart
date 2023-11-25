import 'package:flutter/material.dart';
import 'package:prova_flutter/src/core/theme/theme_config.dart';
import 'package:prova_flutter/src/pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme:  ThemeConfig.theme,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}