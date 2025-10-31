import 'dart:async';
import 'package:flutter/material.dart';
import 'SplashScreen.dart';

// 🚀 ENTRY POINT
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calorie Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: SplashScreen(), // Mulai dari Splash Screen
    );
  }
}