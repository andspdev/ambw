import 'package:flutter/material.dart';


class Bookmark extends StatelessWidget
{
  const Bookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Bookmark", style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold
      )),
    );
  }
}