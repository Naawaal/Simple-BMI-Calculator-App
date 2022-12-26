import 'package:bmi_calculator/classes/app_theme.dart';
import 'package:flutter/material.dart';

import 'bmi.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Bmi(),
      theme: AppTheme.lightPalette,
    );
  }
}
