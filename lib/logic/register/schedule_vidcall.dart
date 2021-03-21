import 'package:flutter_mini_register/helper/datetime.dart';

class ScheduleVidCallLogic {
  bool isDateValid(DateTime? date) => date != null;

  bool isTimeValid(DateTime? time) => time != null;

  bool isDateAndTimeValid(DateTime? date, DateTime? time) {
    if (date == null || time == null) return false;
    return DateTimeHelper.bindDateTime(date, time).isAfter(DateTime.now());
  }
}
