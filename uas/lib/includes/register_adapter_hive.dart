import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uas/adapter/notes_adapter/notes.dart';
import 'package:uas/adapter/pin_adapter/pin.dart';

void registerAdapterHive() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(PinAdapter());
  Hive.registerAdapter(NotesAdapter());
}