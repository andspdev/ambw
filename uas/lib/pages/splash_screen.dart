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


    Timer(const Duration(seconds: 3), () => Navigator.pushReplacement(
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
        child: Column(
          children: <Widget>
          [
            Spacer(),

            Text('NotesTaking', style: TextStyle(
              color: textBlack,
              fontSize: 32,
              fontWeight: FontWeight.bold
            )),

            Spacer(),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 18),
                child: Text(
                  'Dari C14210004',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: textBlackSmooth
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}