import 'dart:convert';

import 'package:comparison/comparison/constant/string_constant.dart';
import 'package:comparison/comparison/data/person_data.dart';
import 'package:comparison/comparison/model/online_status_model.dart';
import 'package:comparison/comparison/model/time_interval_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class DataService {
  static List<TimeIntervalModel> timeIntervals = [];
  static List<TimeIntervalModel> timeIntervalsLast = [];
  static bool isFirstOnline = false;
  static bool isSecondOnline = false;
  static int count = 0;
  static int minutes = 0;

  static Future<void> readData(String path, String key) async {
    String jsonData = await rootBundle.loadString(path);
    OnlineStatusModel onlineStatus =
        OnlineStatusModel.fromJson(json.decode(jsonData));
    if (key == StringConstant.first) {
      isFirstOnline = onlineStatus.online;
    } else {
      isSecondOnline = onlineStatus.online;
    }
    for (var item in onlineStatus.lastOnlines) {
      var ti = TimeIntervalModel(
        start: item.start,
        stop: item.start.add(Duration(seconds: item.duration.toInt())),
        key: key,
      );
      timeIntervals.add(ti);
    }
  }

  static Future<void> compareData() async {
    for (int i = 0; i < timeIntervals.length; i++) {
      for (int j = i + 1; j < timeIntervals.length; j++) {
        if (timeIntervals[i].intersects(timeIntervals[j])) {
          timeIntervalsLast
              .add(timeIntervals[i].intersection(timeIntervals[j]));
        }
      }
    }
  }

  static Future<void> start() async {
    timeIntervals.clear();
    timeIntervalsLast.clear();
    await readData(PersonData.first.datapath, StringConstant.first);
    await readData(PersonData.second.datapath, StringConstant.second);
    await compareData();
    count = timeIntervalsLast.length;
    for (TimeIntervalModel timeInterval in timeIntervalsLast) {
      minutes =
          minutes + timeInterval.stop.difference(timeInterval.start).inMinutes;
    }
  }

  static Future<List<TimeIntervalModel>> getTimeIntervals() async {
    await start();
    timeIntervals.addAll(timeIntervalsLast);
    timeIntervals.sort((a, b) => a.start.compareTo(b.start));
    return timeIntervals;
  }
}
