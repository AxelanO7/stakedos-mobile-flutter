import 'package:flutter/material.dart';
import '../../utils/style_utils.dart';

class ColorStyle {
  static Color get primaryColor => HexColor('f5f5f5');
  static Color get primaryLightColor => HexColor('ffffff');
  static Color get primaryDarkColor => HexColor('c2c2c2');
  static Color get secondaryColor => HexColor('ef534e');
  static Color get secondaryLightColor => HexColor('ff867a');
  static Color get secondaryDarkColor => HexColor('b61825');
  static Color get tertiaryColor => HexColor('64b5f6');
  static Color get tertiaryLightColor => HexColor('9be7ff');
  static Color get tertiaryDarkColor => HexColor('2286c3');
  // static Color get accentLightColor => HexColor('FE9D00');
  // static Color get accentDarkColor => HexColor('FE9D00');
  static Color get lightDarkGreyColor => HexColor('303030');
  static Color get darkGreyColor => HexColor('262626');
  static Color get grayscaleGray1 => HexColor('4E4B66');
  static Color get grayscaleGray3 => HexColor('A0A3BD');
  static Color get grayscaleGray7 => HexColor('D9D9D9');
  static Color get grayscaleGray9 => HexColor('757575');
  static Color get whiteColor => HexColor('FFFFFF');
  static Color get blackColor => HexColor('212121');

  MaterialColor grayscaleRange = MaterialColor(
    0xFF558B2F,
    <int, Color>{
      0: Color(0xFFFFFFFF),
      50: Color(0xFFF9F9F9),
      100: Color(0xFFF1F1F1),
      200: Color(0xFFE8E8E8),
      300: Color(0xFFD8D8D8),
      400: Color(0xFFB4B4B4),
      500: Color(0xFF949494),
      600: Color(0xFF6C6C6C),
      700: Color(0xFF585858),
      900: Color(0xFF1A1A1A),
    },
  );

  MaterialColor redRange = MaterialColor(
    0xFF558B2F,
    <int, Color>{
      50: Color(0xFFFFE9EE),
      100: Color(0xFFFFC9D2),
      200: Color(0xFFF99298),
      // 400: Color(0xFFFF334B),
      400: Color(0xFFFF5569),
      500: Color(0xFFFF002D),
      600: Color(0xFFF6002E),
      700: Color(0xFFE40028),
      800: Color(0xFFD80020),
      900: Color(0xFFC80013),
    },
  );

  MaterialColor orangeRange = MaterialColor(
    0xFF558B2F,
    <int, Color>{
      50: Color(0xFFFFF8E1),
      100: Color(0xFFFFEBB2),
      200: Color(0xFFFFDE81),
      300: Color(0xFFFFD24E),
      400: Color(0xFFFFC726),
      500: Color(0xFFFEBE03),
      600: Color(0xFFFEB000),
      700: Color(0xFFFE9D00),
      800: Color(0xFFFE8C01),
      900: Color(0xFFD68E03),
    },
  );

  MaterialColor blueRange = MaterialColor(
    0xFF558B2F,
    <int, Color>{
      50: Color(0xFFE4F2FF),
      100: Color(0xFFBEDFFF),
      200: Color(0xFF95CCFF),
      300: Color(0xFF6BB7FF),
      400: Color(0xFF4EA8FF),
      500: Color(0xFF3B99FD),
      600: Color(0xFF398AEE),
      700: Color(0xFF3578DB),
      800: Color(0xFF3266C8),
      900: Color(0xFF2C48A8),
    },
  );
}
