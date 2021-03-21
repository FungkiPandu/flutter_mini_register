class DateTimeHelper {
  final DateTime date;

  DateTimeHelper(this.date);

  String get formattedDate => "$dayName, ${date.day} $monthName ${date.year}";

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
}
