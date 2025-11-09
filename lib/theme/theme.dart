import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: false,

  colorScheme: const ColorScheme.light(
    primary: Color(0xFF1565C0), // azul principal mais vibrante
    secondary: Color(0xFF42A5F5), // azul médio
    surface: Color(0xFFE3F2FD), // azul claro de fundo
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Color(0xFF0D47A1), // azul escuro para texto
    background: Color(0xFFE3F2FD),
    onBackground: Color(0xFF0D47A1),
    error: Colors.red,
    onError: Colors.white,
  ),

  scaffoldBackgroundColor: const Color(0xFFE3F2FD),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1565C0),
    foregroundColor: Colors.white,
    elevation: 2,
    centerTitle: true,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
      letterSpacing: 0.5,
    ),
  ),

  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.transparent,
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    hintStyle: const TextStyle(color: Colors.grey),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color(0xFF42A5F5)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color(0xFF1565C0), width: 1.8),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF1565C0),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 3,
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF42A5F5),
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF42A5F5),
    foregroundColor: Colors.white,
  ),

  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: Color(0xFF0D47A1), // azul escuro para títulos
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1565C0),
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      color: Color(0xFF1E88E5),
    ),
  ),
);
