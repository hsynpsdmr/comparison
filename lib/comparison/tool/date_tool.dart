import 'package:intl/intl.dart';

final class DateTool {
  static String formatDate(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime.toLocal());
  }

  static String formatDuration(double duration) {
    int minutes = duration ~/ 60;
    int seconds = (duration % 60).toInt();
    return "$minutes Mins $seconds Secs";
  }
}
