import 'package:comparison/comparison/constant/string_constant.dart';
import 'package:comparison/comparison/data/person_data.dart';
import 'package:comparison/comparison/service/data_service.dart';
import 'package:comparison/comparison/tool/color_tool.dart';
import 'package:comparison/comparison/widget/image_widget.dart';
import 'package:comparison/comparison/widget/text_widget.dart';
import 'package:comparison/comparison/widget/time_box_widget.dart';
import 'package:flutter/material.dart';

class ComparisonView extends StatelessWidget {
  const ComparisonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTool.primaryColor,
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: DataService.getTimeIntervals(),
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.only(top: 43, left: 30, right: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.menu_rounded,
                          color: ColorTool.secondaryColor, size: 22),
                      TextWidget.text(
                          StringConstant.title, 17, FontWeight.w700),
                      const Icon(Icons.notifications_rounded,
                          color: ColorTool.secondaryColor, size: 22),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    width: 302,
                    height: 261,
                    decoration: ShapeDecoration(
                      color: ColorTool.primaryColorLight,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  TextWidget.text(StringConstant.firstPerson,
                                      10, FontWeight.w500),
                                  ImageWidget.imageBox(
                                      DataService.isFirstOnline
                                          ? ColorTool.onlineBackground
                                          : ColorTool.offlineBackground,
                                      PersonData.first.photopath),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: TextWidget.text(
                                        PersonData.first.name,
                                        10,
                                        FontWeight.w500),
                                  ),
                                  TextWidget.text(PersonData.first.phone, 9,
                                      FontWeight.w300),
                                ],
                              ),
                              Column(
                                children: [
                                  TextWidget.text(StringConstant.secondPerson,
                                      10, FontWeight.w500),
                                  ImageWidget.imageBox(
                                      DataService.isSecondOnline
                                          ? ColorTool.onlineBackground
                                          : ColorTool.offlineBackground,
                                      PersonData.second.photopath),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: TextWidget.text(
                                        PersonData.second.name,
                                        10,
                                        FontWeight.w500),
                                  ),
                                  TextWidget.text(PersonData.second.phone, 9,
                                      FontWeight.w300),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 14),
                              width: 281,
                              height: 61,
                              decoration: ShapeDecoration(
                                color: ColorTool.primaryColorDark,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 0.20,
                                      color: ColorTool.secondaryColor),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                              child: TextWidget.richText(
                                  DataService.count, DataService.minutes))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Column(
                    children: TimeBoxWidget.create(snapshot.data ?? []),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
