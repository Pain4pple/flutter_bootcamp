import 'package:expenses_tracker/expenses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 48, 38, 94));
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        ).copyWith(
          scaffoldBackgroundColor: const Color.fromARGB(255, 234, 234, 238),
          textTheme: GoogleFonts.outfitTextTheme(),
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            shadowColor: const Color.fromARGB(0, 255, 193, 7),
            margin: const EdgeInsets.all(5)
          )
        ),
        home: Expenses());
  }
}
