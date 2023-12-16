import 'package:comparison/comparison/constant/string_constant.dart';
import 'package:comparison/comparison/tool/color_tool.dart';
import 'package:flutter/material.dart';

final class TextWidget {
  static Text text(String text, double fontSize, FontWeight fontWeight) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: textStyle(ColorTool.white, fontSize, fontWeight),
    );
  }

  static TextSpan textSpan(String text, Color color, FontWeight fontWeight) {
    return TextSpan(
      text: text,
      style: textStyle(color, 9, fontWeight),
    );
  }

  static TextStyle textStyle(
      Color color, double fontSize, FontWeight fontWeight) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: StringConstant.fontFamily,
      fontWeight: fontWeight,
      height: 0,
    );
  }

  static richText(int count, int minutes) {
    return Text.rich(
      TextSpan(
        children: [
          TextWidget.textSpan(
              'In the last 24 hours, the people you selected have been online ',
              ColorTool.white,
              FontWeight.w400),
          TextWidget.textSpan(
              '$count times', ColorTool.secondaryColor, FontWeight.w700),
          TextWidget.textSpan(
              ' at the same time. They were online for a total of ',
              ColorTool.white,
              FontWeight.w400),
          TextWidget.textSpan(
              '$minutes minutes', ColorTool.secondaryColor, FontWeight.w700),
          TextWidget.textSpan(
              ' at the same time.', ColorTool.white, FontWeight.w400),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
