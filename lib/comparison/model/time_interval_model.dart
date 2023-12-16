final class TimeIntervalModel {
  final DateTime start;
  final DateTime stop;
  final String? key;

  TimeIntervalModel({
    required this.start,
    required this.stop,
    this.key,
  });

  factory TimeIntervalModel.fromJson(Map<String, dynamic> json) {
    return TimeIntervalModel(
      start: _parseDateTime(json['start']),
      stop: _parseDateTime(json['stop']),
      key: json['key'],
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

  @override
  String toString() {
    return 'TimeInterval{start: $start, stop: $stop, key: $key}';
  }

  bool intersects(TimeIntervalModel other) {
    return start.isBefore(other.stop) && stop.isAfter(other.start);
  }

  TimeIntervalModel intersection(TimeIntervalModel other) {
    if (!intersects(other)) {
      // Zaman aralıkları çakışmıyorsa null dönebiliriz.
      return TimeIntervalModel(start: DateTime.now(), stop: DateTime.now());
    }

    final intersectStart = start.isAfter(other.start) ? start : other.start;
    final intersectStop = stop.isBefore(other.stop) ? stop : other.stop;

    return TimeIntervalModel(
        start: intersectStart, stop: intersectStop, key: 'IS');
  }

  TimeIntervalModel findOverlap(List<TimeIntervalModel> intervals) {
    TimeIntervalModel overlap = this;

    for (final interval in intervals) {
      if (intersects(interval)) {
        overlap = overlap.intersection(interval);
      }
    }

    return overlap;
  }
}
