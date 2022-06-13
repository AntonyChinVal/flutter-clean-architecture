import 'package:flutter/material.dart';
import 'package:ui/theme/app_colors.dart';

class Shadows {
  static BoxShadow shadow1 = BoxShadow(
    color: AppColors.white.withOpacity(0.8),
    spreadRadius: 5,
    blurRadius: 10,
    offset: const Offset(0, 2),
  );
  static BoxShadow shadow2 = BoxShadow(
    color: AppColors.white.withOpacity(0.8),
    spreadRadius: 3,
    blurRadius: 3,
    offset: const Offset(0, 2),
  );
}
