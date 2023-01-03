import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// テーマ設定
final themeProvider = Provider((ref) {
  return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.orange,
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFCC80), centerTitle: true));
});
