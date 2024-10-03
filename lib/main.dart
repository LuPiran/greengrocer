import 'package:flutter/material.dart';
import 'package:greengrocer/src/screen/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greengrocer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF8BC34A)),
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      home: SplashScreen(),
    );
  }
}
