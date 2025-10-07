import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MediVerifyApp());
}

class MediVerifyApp extends StatelessWidget {
  const MediVerifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryGreen = const Color(0xFF27AE60);
    return MaterialApp(
      title: 'MediVerify',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryGreen),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
