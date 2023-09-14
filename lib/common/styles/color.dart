import 'package:flutter/material.dart';
import 'package:youapp_test/tool/hex_color.dart';

final hBlack = HexColor("#000000");
final hWhite = HexColor("#FFFFFF");
final hPrimary1 = HexColor("#1F4247");
final hPrimary2 = HexColor("#0D1D23");
final hPrimary3 = HexColor("#09141A");
final hSecond1 = HexColor("#62CDCB");
final hSecond2 = HexColor("#4599DB");

final hGolden = [
  HexColor("#94783E"),
  HexColor("#F3EDA6"),
  HexColor("#F8FAE5"),
  HexColor("#FFE2BE"),
  HexColor("#D5BE88"),
  HexColor("#F8FAE5"),
  HexColor("#D5BE88"),
];

final MaterialColor mBlack = _convertMaterial(0, 0, 0);
final MaterialColor mPrimary = _convertMaterial(9, 20, 26);

MaterialColor _convertMaterial(int red, int green, int blue) {
  Map<int, Color> colorCodes = {
    50: Color.fromRGBO(red, green, blue, .1),
    100: Color.fromRGBO(red, green, blue, .2),
    200: Color.fromRGBO(red, green, blue, .3),
    300: Color.fromRGBO(red, green, blue, .4),
    400: Color.fromRGBO(red, green, blue, .5),
    500: Color.fromRGBO(red, green, blue, .6),
    600: Color.fromRGBO(red, green, blue, .7),
    700: Color.fromRGBO(red, green, blue, .8),
    800: Color.fromRGBO(red, green, blue, .9),
    900: Color.fromRGBO(red, green, blue, 1),
  };

  return MaterialColor(0xFF93cd48, colorCodes);
}
