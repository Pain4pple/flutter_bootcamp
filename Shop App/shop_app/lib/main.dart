import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/screens/shopping_list.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}


final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(255, 144, 215, 51),
  ),
  textTheme: GoogleFonts.poppinsTextTheme(),
);


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: ShoppingList()
    );
  }
}
