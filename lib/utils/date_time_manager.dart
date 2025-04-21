import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as time_ago;

class DateTimeManager {
  DateTimeManager._();
  static String currentDate() {
    DateTime current = DateTime.now();
    return DateFormat.yMEd().add_jms().format(current);
  }

  static String getDate(String createdAt) {
    DateTime dateTime = DateFormat.yMEd().add_jms().parse(createdAt);
    return time_ago.format(dateTime);
  }
}