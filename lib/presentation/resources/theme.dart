import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

/// Color: https://colorhunt.co/palette/fcecddffc288fea82fff6701

// テーマ設定
final themeProvider = Provider((ref) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: HexColor('FF6701'),
      secondary: HexColor('FEA82F'),
      background: HexColor('FFFFFF'),
    ),
    appBarTheme:
        AppBarTheme(backgroundColor: HexColor('FFC288'), centerTitle: true),
  );
});
