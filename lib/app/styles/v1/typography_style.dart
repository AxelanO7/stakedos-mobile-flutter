import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TypographyStyle {
  static TextStyle get heading1Medium => TextStyle(
      fontFamily: 'PoppinsMedium', fontSize: 36, fontWeight: FontWeight.w400);
  static TextStyle get heading2Medium => TextStyle(
      fontFamily: 'PoppinsMedium',
      fontSize: 36,
      fontWeight: FontWeight.w500,
      letterSpacing: 16);
  static TextStyle get heading3Medium => TextStyle(
      fontFamily: 'PoppinsMedium', fontSize: 24, fontWeight: FontWeight.w500);
  static TextStyle get heading3Bold => TextStyle(
      fontFamily: 'PoppinsBolds', fontSize: 36, fontWeight: FontWeight.w600);
  static TextStyle get heading4Bold => TextStyle(
      fontFamily: 'PoppinsBolds', fontSize: 24, fontWeight: FontWeight.w700);

  static TextStyle get body1Bold => TextStyle(
      fontFamily: 'PoppinsMedium', fontSize: 16, fontWeight: FontWeight.w700);
  static TextStyle get body2Bold => TextStyle(
      fontFamily: 'PoppinsBolds', fontSize: 20, fontWeight: FontWeight.w700);
  static TextStyle get body3Bold => TextStyle(
      fontFamily: 'PoppinsBolds', fontSize: 16, fontWeight: FontWeight.w700);
  static TextStyle get body1Medium => TextStyle(
      fontFamily: 'PoppinsMedium', fontSize: 26, fontWeight: FontWeight.w500);
  static TextStyle get body2Medium => TextStyle(
      fontFamily: 'PoppinsMedium', fontSize: 18, fontWeight: FontWeight.w500);
  static TextStyle get body3Medium => TextStyle(
      fontFamily: 'PoppinsMedium', fontSize: 12, fontWeight: FontWeight.w500);
  static TextStyle get body4Medium => TextStyle(
      fontFamily: 'PoppinsMedium', fontSize: 14, fontWeight: FontWeight.w500);
  static TextStyle get body1Reguler => TextStyle(
      fontFamily: 'PoppinsReguler', fontSize: 18, fontWeight: FontWeight.w400);
  static TextStyle get body2Reguler => TextStyle(
      fontFamily: 'PoppinsReguler', fontSize: 16, fontWeight: FontWeight.w400);
  static TextStyle get body3Reguler => TextStyle(
      fontFamily: 'PoppinsReguler', fontSize: 14, fontWeight: FontWeight.w400);
  static TextStyle get body1SemiBold => TextStyle(
      fontFamily: 'PoppinsSemiBold', fontSize: 14, fontWeight: FontWeight.w600);
  static TextStyle get body2SemiBold => TextStyle(
      fontFamily: 'PoppinsSemiBold', fontSize: 16, fontWeight: FontWeight.w600);
  static TextStyle get body3SemiBold => TextStyle(
      fontFamily: 'PoppinsSemiBold', fontSize: 12, fontWeight: FontWeight.w600);
}
