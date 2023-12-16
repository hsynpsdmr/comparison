import 'package:comparison/comparison/constant/string_constant.dart';
import 'package:comparison/comparison/model/time_interval_model.dart';
import 'package:comparison/comparison/tool/color_tool.dart';
import 'package:comparison/comparison/tool/date_tool.dart';
import 'package:comparison/comparison/widget/container_widget.dart';
import 'package:comparison/comparison/widget/text_widget.dart';
import 'package:flutter/material.dart';

class TimeBoxWidget {
  static List<Widget> create(List<TimeIntervalModel> timeIntervals) {
    List<Widget> list = [];
    for (var item in timeIntervals) {
      list.add(const SizedBox(height: 6));
      if (item.key == 'IS') {
        list.add(
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                children: [
                  ContainerWidget.timeBox(
                    ColorTool.accentColor,
                    Opacity(
                      opacity: 1,
                      child: TextWidget.text(
                          DateTool.formatDate(item.start), 8, FontWeight.w500),
                    ),
                  ),
                  const Spacer(),
                  ContainerWidget.timeBox(
                    ColorTool.accentColor,
                    Opacity(
                      opacity: 1,
                      child: TextWidget.text(
                          DateTool.formatDate(item.start), 8, FontWeight.w500),
                    ),
                  ),
                ],
              ),
              ContainerWidget.timeBox(
                ColorTool.accentColor,
                TextWidget.text(
                    DateTool.formatDuration(
                        item.stop.difference(item.start).inSeconds.toDouble()),
                    6,
                    FontWeight.w700),
              )
            ],
          ),
        );
      } else {
        bool isOnlineFirst = item.key == StringConstant.first;
        bool isOnlineSecond = item.key == StringConstant.second;
        list.add(
          Row(
            children: [
              ContainerWidget.timeBox(
                isOnlineFirst
                    ? ColorTool.secondaryColor
                    : ColorTool.primaryColorLight,
                Opacity(
                  opacity: isOnlineFirst ? 1 : 0.5,
                  child: TextWidget.text(
                      DateTool.formatDate(item.start), 8, FontWeight.w500),
                ),
              ),
              const Spacer(),
              ContainerWidget.timeBox(
                isOnlineSecond
                    ? ColorTool.secondaryColor
                    : ColorTool.primaryColorLight,
                Opacity(
                  opacity: isOnlineSecond ? 1 : 0.5,
                  child: TextWidget.text(
                      DateTool.formatDate(item.start), 8, FontWeight.w500),
                ),
              ),
            ],
          ),
        );
      }
    }
    return list;
  }
}
