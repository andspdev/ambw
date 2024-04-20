import 'package:flutter/material.dart';


class TopFoodie extends StatelessWidget
{
  const TopFoodie({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Top Foodie", style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold
      )),
    );
  }
}