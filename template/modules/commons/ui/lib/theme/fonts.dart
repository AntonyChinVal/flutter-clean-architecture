import 'package:flutter/material.dart';
import 'package:ui/theme/app_colors.dart';

const _fontBase = 'Arial';

class Fonts {
  static const TextStyle label1 = TextStyle(
    fontSize: 15,
    fontFamily: _fontBase,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle label2 = TextStyle(
      fontFamily: _fontBase,
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: AppColors.white);
  static const TextStyle label3 = TextStyle(
      fontFamily: _fontBase,
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: AppColors.white);
  static const TextStyle label4 = TextStyle(
      fontFamily: _fontBase,
      fontSize: 13,
      fontWeight: FontWeight.w700,
      color: AppColors.white);
  static const TextStyle label5 = TextStyle(
      fontFamily: _fontBase,
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: AppColors.white);
  static const TextStyle label6 = TextStyle(
      fontFamily: _fontBase,
      fontSize: 25,
      fontWeight: FontWeight.w700,
      color: AppColors.white);
  static const TextStyle input1 = TextStyle(fontSize: 15);
  static const TextStyle button1 = TextStyle(
    fontSize: 15,
    fontFamily: _fontBase,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle avatar = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
}
