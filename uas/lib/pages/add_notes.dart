import 'package:flutter/material.dart';
import 'package:uas/constant/colors.dart';

class AddNotes extends StatefulWidget 
{
  const AddNotes({ super.key });

  @override
  _AddNotes createState() => _AddNotes();
}

class _AddNotes extends State<AddNotes>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: const BoxDecoration(
            color: backgroundColor,
            border: Border(
              bottom: BorderSide(
                color: smoothGrey,
                width: 2.0,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: smoothGrey,
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            title: const Text('Add Notes', style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textBlack
            ),),
            backgroundColor: backgroundColor,
            elevation: 0,
          ),
        ),
      ),
      
      body: Container(
          padding: const EdgeInsets.all(20),
          child: null
        )
      );
  }
}