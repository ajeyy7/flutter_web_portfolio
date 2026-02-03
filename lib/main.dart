import 'package:Portfolio_Ajay/features/home/home.dart';
import 'package:Portfolio_Ajay/features/splash/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashOverlayScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEFEFEF),
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
    );
  }
}

class SplashOverlayScreen extends StatelessWidget {
  const SplashOverlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Home screen underneath
        const HomeScreen(),
        // Splash screen overlay on top
        const SplashScreen(),
      ],
    );
  }
}
