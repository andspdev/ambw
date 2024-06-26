import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uas/adapter/pin_adapter/pin.dart';
import 'package:uas/constant/colors.dart';
import 'package:uas/model/pin_model.dart';
import 'package:uas/pages/home_screen.dart';
import 'package:uas/pages/pin_screen.dart';

class SplashScreen extends StatefulWidget 
{
  const SplashScreen({ super.key });

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>
{
  late Box<Pin> pinSaved;

  @override
  void initState()
  {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () async 
    {
      pinSaved = await openPinModel();
      Pin? getPinSaved = await getPinModel(pinSaved);

      dynamic materialPageRoute = const HomeScreen();
      if (getPinSaved != null)
      {
        materialPageRoute = const PinScreen();
        
      }

      Timer(const Duration(seconds: 2), () => 
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => materialPageRoute)
      ));

      pinSaved.close();
    });
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