final class OnlineSessionModel {
  final DateTime start;
  final double duration;

  OnlineSessionModel({
    required this.start,
    required this.duration,
  });

  factory OnlineSessionModel.fromJson(Map<String, dynamic> json) {
    return OnlineSessionModel(
      start: _parseDateTime(json['start']),
      duration: (json['duration'] ?? 0).toDouble(),
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
}
