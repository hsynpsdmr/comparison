import 'package:comparison/comparison/tool/color_tool.dart';
import 'package:flutter/material.dart';

final class ImageWidget {
  static Padding imageBox(List<Color> colors, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(top: 9),
      child: Row(
        children: [
          const SizedBox(width: 25),
          Container(
            alignment: Alignment.center,
            width: 74,
            height: 75,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: const Alignment(1.00, 0.00),
                end: const Alignment(-1, 0),
                colors: colors,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              shadows: const [
                BoxShadow(
                  color: ColorTool.shadowColor1,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Container(
              alignment: Alignment.center,
              width: 72.83,
              height: 71.21,
              decoration: ShapeDecoration(
                color: ColorTool.primaryColorLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                shadows: const [
                  BoxShadow(
                    color: ColorTool.shadowColor1,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Container(
                width: 60,
                height: 60,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8),
            width: 17,
            height: 17,
            decoration: ShapeDecoration(
              color: ColorTool.primaryColorLight,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.10,
                  color: ColorTool.white.withOpacity(0.5),
                ),
                borderRadius: BorderRadius.circular(3),
              ),
              shadows: const [
                BoxShadow(
                  color: ColorTool.shadowColor2,
                  blurRadius: 4,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                )
              ],
            ),
            child: const InkWell(
              onTap: null,
              child: Icon(Icons.edit_rounded, color: ColorTool.white, size: 11),
            ),
          ),
        ],
      ),
    );
  }
}
