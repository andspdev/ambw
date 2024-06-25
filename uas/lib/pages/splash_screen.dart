import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uas/constant/colors.dart';
import 'package:uas/pages/pin_screen.dart';

class SplashScreen extends StatefulWidget 
{
  const SplashScreen({ super.key });

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>
{
  @override
  void initState()
  {
    super.initState();


    Timer(const Duration(seconds: 2), () => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const PinScreen())
    ));
  }

  @override
  Widget build(BuildContext context)
  {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Text('Ini Splash Screen'),
      ),
    );
  }
}