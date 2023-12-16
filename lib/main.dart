import 'package:comparison/comparison/constant/string_constant.dart';
import 'package:comparison/comparison/tool/color_tool.dart';
import 'package:comparison/comparison/view/comparison_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringConstant.title,
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: ColorTool.secondaryColor),
          useMaterial3: true,
        ),
        home: const ComparisonView(),
      ),
    );
  }
}
