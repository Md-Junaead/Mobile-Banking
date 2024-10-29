import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Mobile Banking App/View/main_home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

//Root Widget of the app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.jostTextTheme(),
      ),
      home: const MainHomeScreen(),
    );
  }
}
