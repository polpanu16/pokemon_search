import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      useMaterial3: true,
      fontFamily: "Kanit",
      appBarTheme: appBarTheme());
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.red,
    elevation: 0,
    centerTitle: true,
  );
}
