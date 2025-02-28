import 'package:fave_places/screens/places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
// final colorScheme = ColorScheme.fromSeed(
//   brightness: Brightness.dark,
//   seedColor: const Color.fromARGB(255, 102, 6, 247),
//   background: const Color.fromARGB(255, 56, 49, 66),
// );

final theme = ThemeData().copyWith(
  // scaffoldBackgroundColor: colorScheme.background,
  // colorScheme: colorScheme,
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: const Color.fromARGB(221, 41, 35, 35), // Applies to all CircularProgressIndicator
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: const Color.fromARGB(221, 41, 35, 35), // Applies to all TextField cursors
  ),
  textTheme: GoogleFonts.poppinsTextTheme().copyWith(
    titleSmall: GoogleFonts.poppins(fontWeight: FontWeight.bold),
    titleMedium: GoogleFonts.poppins(fontWeight: FontWeight.bold),
    titleLarge: GoogleFonts.poppins(fontWeight: FontWeight.bold),
  ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Favorite Places', theme: theme, home: PlacesScreen());
  }
}
