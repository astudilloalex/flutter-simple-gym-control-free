import 'package:flutter/material.dart';
import 'package:simple_gym_control_free/src/ui/theme/colors.dart';

class AppThemeData {
  const AppThemeData._();

  static ThemeData get dark {
    return ThemeData.dark();
  }

  static ThemeData get light {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: LightColors.primary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        backgroundColor: LightColors.primary,
        foregroundColor: Colors.white,
        elevation: 0.0,
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: LightColors.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: LightColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        isDense: true,
      ),
    );
  }
}
