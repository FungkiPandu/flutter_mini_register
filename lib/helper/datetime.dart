import 'package:flutter/material.dart';

class DateTimeHelper {
  final DateTime date;

  DateTimeHelper(this.date);

  String get formattedDate => "$dayName, ${date.day} $monthName ${date.year}";

  String get formattedTime => "${twoDigit(date.hour)}:${twoDigit(date.minute)}";

  String twoDigit(int value) {
    var digits = value.toString();
    if (value < 10 && value >= 0) digits = "0$digits";
    return digits;
  }

  get dayName {
    switch (date.weekday) {
      case DateTime.monday:
        return "Senin";
      case DateTime.tuesday:
        return "Selasa";
      case DateTime.wednesday:
        return "Rabu";
      case DateTime.thursday:
        return "Kamis";
      case DateTime.friday:
        return "Jum'at";
      case DateTime.saturday:
        return "Sabtu";
      case DateTime.sunday:
        return "Minggu";
    }
    return "";
  }

  get monthName {
    var months = [
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember",
    ];
    return months[date.month - 1];
  }

  static DateTime toDateTime(TimeOfDay time) {
    final now = new DateTime.now();
    return new DateTime(now.year, now.month, now.day, time.hour, time.minute);
  }

  static DateTime bindDateAndTime(DateTime date, TimeOfDay time) {
    return new DateTime(
        date.year, date.month, date.day, time.hour, time.minute);
  }

  static DateTime bindDateTime(DateTime date, DateTime time) {
    return new DateTime(
        date.year, date.month, date.day, time.hour, time.minute);
  }
}
