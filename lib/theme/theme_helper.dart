import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors(),
    'secondary': SecondaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme,
    'secondary': ColorSchemes.secondaryColorScheme
  };

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.cyan300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Color(0XFFFFFFFF),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: colorScheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.blueGray50,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyMedium: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: colorScheme.errorContainer,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: getFontSize(
            26,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: getFontSize(
            24,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: colorScheme.errorContainer,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: appTheme.cyan100,
          fontSize: getFontSize(
            10,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        labelSmall: TextStyle(
          color: colorScheme.errorContainer,
          fontSize: getFontSize(
            8,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: colorScheme.primary,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFFFFFFFF),
    primaryContainer: Color(0XFF555555),
    secondary: Color(0XFF555555),
    secondaryContainer: Color(0XFFFFFFFF),
    tertiary: Color(0XFF555555),
    tertiaryContainer: Color(0XFFFFFFFF),

    // Background colors
    background: Color(0XFF555555),

    // Surface colors
    surface: Color(0XFF555555),
    surfaceTint: Color(0XFF223263),
    surfaceVariant: Color(0XFFFFFFFF),

    // Error colors
    error: Color(0XFF223263),
    errorContainer: Color(0XFFADADAD),
    onError: Color(0XFFFFFFFF),
    onErrorContainer: Color(0XFF232323),

    // On colors(text colors)
    onBackground: Color(0XFFFFFFFF),
    onInverseSurface: Color(0XFFFFFFFF),
    onPrimary: Color(0XFF223263),
    onPrimaryContainer: Color(0XFFFFFFFF),
    onSecondary: Color(0XFFFFFFFF),
    onSecondaryContainer: Color(0XFF223263),
    onTertiary: Color(0XFFFFFFFF),
    onTertiaryContainer: Color(0XFF223263),

    // Other colors
    outline: Color(0XFF223263),
    outlineVariant: Color(0XFF555555),
    scrim: Color(0XFF555555),
    shadow: Color(0XFF223263),

    // Inverse colors
    inversePrimary: Color(0XFF555555),
    inverseSurface: Color(0XFF223263),

    // Pending colors
    onSurface: Color(0XFFFFFFFF),
    onSurfaceVariant: Color(0XFF223263),
  );

  static final secondaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFFFFFFFF),
    primaryContainer: Color(0XFF555555),
    secondary: Color(0XFF555555),
    secondaryContainer: Color(0XFFFFFFFF),
    tertiary: Color(0XFF555555),
    tertiaryContainer: Color(0XFFFFFFFF),

    // Background colors
    background: Color(0XFF555555),

    // Surface colors
    surface: Color(0XFF555555),
    surfaceTint: Color(0XFF223263),
    surfaceVariant: Color(0XFFFFFFFF),

    // Error colors
    error: Color(0XFF223263),
    errorContainer: Color(0XFFADADAD),
    onError: Color(0XFFFFFFFF),
    onErrorContainer: Color(0XFF232323),

    // On colors(text colors)
    onBackground: Color(0XFFFFFFFF),
    onInverseSurface: Color(0XFFFFFFFF),
    onPrimary: Color(0XFF223263),
    onPrimaryContainer: Color(0XFFFFFFFF),
    onSecondary: Color(0XFFFFFFFF),
    onSecondaryContainer: Color(0XFF223263),
    onTertiary: Color(0XFFFFFFFF),
    onTertiaryContainer: Color(0XFF223263),

    // Other colors
    outline: Color(0XFF223263),
    outlineVariant: Color(0XFF555555),
    scrim: Color(0XFF555555),
    shadow: Color(0XFF223263),

    // Inverse colors
    inversePrimary: Color(0XFF555555),
    inverseSurface: Color(0XFF223263),

    // Pending colors
    onSurface: Color(0XFFFFFFFF),
    onSurfaceVariant: Color(0XFF223263),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);

  // Blue
  Color get blue50 => Color(0XFFEAEFFF);

  // BlueGray
  Color get blueGray100 => Color(0XFFCFCFCF);
  Color get blueGray10001 => Color(0XFFD4D4D4);
  Color get blueGray300 => Color(0XFF9098B1);
  Color get blueGray400 => Color(0XFF888888);
  Color get blueGray50 => Color(0XFFE8F3F1);

  // Cyan
  Color get cyan100 => Color(0XFFC0F3EE);
  Color get cyan300 => Color(0XFF52D1C6);

  // Gray
  Color get gray400 => Color(0XFFC4C4C4);
  Color get gray50 => Color(0XFFFAFAFA);

  // Green
  Color get green300 => Color(0XFF7AEA78);

  // Indigo
  Color get indigoA200 => Color(0XFF5B61F4);

  // Red
  Color get red300 => Color(0XFFFB6868);

  // Teal
  Color get teal100 => Color(0XFFB3D3CE);
  Color get teal300 => Color(0XFF36B3A8);
  Color get teal400 => Color(0XFF30ADA2);
}

/// Class containing custom colors for a secondary theme.
class SecondaryColors extends PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);

  // Blue
  Color get blue50 => Color(0XFFEAEFFF);

  // BlueGray
  Color get blueGray100 => Color(0XFFCFCFCF);
  Color get blueGray10001 => Color(0XFFD4D4D4);
  Color get blueGray300 => Color(0XFF9098B1);
  Color get blueGray400 => Color(0XFF888888);
  Color get blueGray50 => Color(0XFFE8F3F1);

  // Cyan
  Color get cyan100 => Color(0XFFC0F3EE);
  Color get cyan300 => Color(0XFF52D1C6);

  // Gray
  Color get gray400 => Color(0XFFC4C4C4);
  Color get gray50 => Color(0XFFFAFAFA);

  // Green
  Color get green300 => Color(0XFF7AEA78);

  // Indigo
  Color get indigoA200 => Color(0XFF5B61F4);

  // Red
  Color get red300 => Color(0XFFFB6868);

  // Teal
  Color get teal100 => Color(0XFFB3D3CE);
  Color get teal300 => Color(0XFF36B3A8);
  Color get teal400 => Color(0XFF30ADA2);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
