import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyle   {


  static const String roboto = "Roboto";


  //26
  static TextStyle? get titleLarge => const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: FontSize.size26,
    fontFamily: roboto,
    color: AppColors.black,
  );

  //16
  static TextStyle? get titleMedium => const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: FontSize.size16,
    fontFamily: roboto,
    color: AppColors.black,
  );

  //14
  static TextStyle? get titleSmall => const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: FontSize.size14,
    fontFamily: roboto,
    color: AppColors.black,
  );


  //12
  static TextStyle? get bodySmall => const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: FontSize.size12,
    fontFamily: roboto,
    color: AppColors.black,
  );


  //10 & 8
  static TextStyle? get labelSmall => const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: FontSize.size10,
    fontFamily: roboto,
    color: AppColors.black,
  );




}

@immutable
class FontSize {
  const FontSize._();
  static const double size26 = 26;
  static const double size16 = 16;
  static const double size14 = 14;
  static const double size12 = 12;
  static const double size10 = 10;

}
