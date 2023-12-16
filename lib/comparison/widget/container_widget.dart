import 'package:flutter/material.dart';

final class ContainerWidget {
  static Container timeBox(Color color, Widget child) {
    return Container(
      alignment: Alignment.center,
      width: 120,
      height: 21,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      ),
      child: child,
    );
  }
}
