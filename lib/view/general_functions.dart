import '../model/message_model.dart';

String monthToWord(int monthInt, bool initials) {
  String month;
  int x = (monthInt - 1) % 12 + 1;
  if (x == 1) {
    month = "January";
  } else if (x == 2) {
    month = "February";
  } else if (x == 3) {
    month = "March";
  } else if (x == 4) {
    month = "April";
  } else if (x == 5) {
    month = "May";
  } else if (x == 6) {
    month = "June";
  } else if (x == 7) {
    month = "July";
  } else if (x == 8) {
    month = "August";
  } else if (x == 9) {
    month = "September";
  } else if (x == 10) {
    month = "October";
  } else if (x == 11) {
    month = "November";
  } else if (x == 12) {
    month = "December";
  } else {
    month = "XXXXX";
  }
  if (initials) {
    return month.substring(0, 3);
  } else {
    return month;
  }
}

double countMessageMatchMonth(List<Message> list, int monthOffset) {
  return list
      .where((element) =>
          (element.dateTime.month == DateTime.now().month - monthOffset))
      .toSet()
      .toList()
      .length
      .toDouble();
}
