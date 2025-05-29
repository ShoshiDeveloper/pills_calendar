extension DatetimeExt on DateTime {
  String get readable => "${day.toString().padLeft(2, '0')}.${month.toString().padLeft(2, '0')}";
  String get readableTime => "${hour.toString().padLeft(2, '0')}.${minute.toString().padLeft(2, '0')}";
}
