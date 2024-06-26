import 'package:flutter/material.dart';
import 'package:uas/constant/colors.dart';

Widget loaderSmallCenter()
{
  return const Center(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
          strokeWidth: 2.5,
        ),
      ),
    ),
  );
}