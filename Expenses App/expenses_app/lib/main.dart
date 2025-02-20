import 'package:expenses_app/expenses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 7, 13, 20));
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
          scaffoldBackgroundColor: const Color.fromARGB(255, 7, 13, 20),
          cardTheme: CardTheme(color: const Color.fromARGB(255, 52, 53, 69)),
          textTheme: GoogleFonts.outfitTextTheme(),
          iconTheme: IconThemeData(color: Colors.white),
          appBarTheme: AppBarTheme(color: const Color.fromARGB(255, 42, 42, 53)),
        ),
        home: Expenses());
  }
}
