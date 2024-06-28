import 'dart:async';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uas/adapter/notes_adapter/notes.dart';

Future<Box<Notes>> openNotesModel() async
{
  Box<Notes> notes = await Hive.openBox<Notes>('notes');
  return notes;
}

Future<void> addNotesModel(notes, Notes saved) async
{
  await notes.add(saved);
}

