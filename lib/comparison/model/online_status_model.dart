import 'package:comparison/comparison/model/online_session_model.dart';

final class OnlineStatusModel {
  final bool online;
  final DateTime lastOnline;
  final List<OnlineSessionModel> lastOnlines;

  OnlineStatusModel({
    required this.online,
    required this.lastOnline,
    required this.lastOnlines,
  });

  factory OnlineStatusModel.fromJson(Map<String, dynamic> json) {
    return OnlineStatusModel(
      online: json['online'] ?? false,
      lastOnline: _parseDateTime(json['lastOnline']),
      lastOnlines: _parseOnlineSessions(json['lastOnlines']),
    );
  }

  static DateTime _parseDateTime(Map<String, dynamic> json) {
    return DateTime.fromMillisecondsSinceEpoch(
      json['_seconds'] * 1000,
      isUtc: true,
    ).add(
      Duration(microseconds: json['_nanoseconds'] ~/ 1000),
    );
  }

  static List<OnlineSessionModel> _parseOnlineSessions(List<dynamic> sessions) {
    return sessions
        .map((session) => OnlineSessionModel.fromJson(session))
        .toList();
  }
}
