import 'package:flutter/material.dart';

// Definisikan warna utama agar mudah diganti di satu tempat
const Color primaryColor = Color(0xFF3B62FF);
const Color textColor = Color(0xFF1C1C1C);
const Color subtitleColor = Color(0xFF87879D);
const Color backgroundColor = Colors.white;

// Konfigurasi tema utama aplikasi
final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: backgroundColor,

  // Skema warna
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    primary: primaryColor,
    background: backgroundColor,
    brightness: Brightness.light,
  ),

  // Tema untuk teks
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: textColor,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18,
      color: textColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      color: subtitleColor,
    ),
  ),

  // Tema untuk input field
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: primaryColor, width: 2),
    ),
    labelStyle: const TextStyle(color: subtitleColor),
  ),

  // Tema untuk tombol utama
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    ),
  ),

  // Tema untuk tombol teks
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: subtitleColor,
      textStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
      ),
    ),
  ),
);
