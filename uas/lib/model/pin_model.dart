import 'dart:async';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uas/adapter/pin_adapter/pin.dart';

Future<Box<Pin>> openPinModel() async
{
  Box<Pin> pinSaved = await Hive.openBox<Pin>('pinSaved');
  return pinSaved;
}

Future<void> savePinModel(Box<Pin> pinSaved, Pin pin) async 
{
  await pinSaved.put('pinSaved', pin);
}

Future<Pin?> getPinModel(Box<Pin> pinSaved) async 
{
  return pinSaved.get('pinSaved');
}

Future<void> deletePinModel(Box<Pin> pinSaved) async 
{
  await pinSaved.delete('pinSaved');
}