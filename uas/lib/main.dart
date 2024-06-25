import 'package:flutter/material.dart';
import 'package:uas/constant/debug_status.dart';
import 'package:uas/pages/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'UAS AMBW - C14210004',
      debugShowCheckedModeBanner: debugStatus,
      home: SplashScreen(),
    );
  }
}
