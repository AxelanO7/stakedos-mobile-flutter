import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class TimeHelper {
  static String intToTimeLeft(int value) {
    int h, m, s;

    h = value ~/ 3600;

    m = ((value - h * 3600)) ~/ 60;

    s = value - (h * 3600) - (m * 60);

    String hourLeft = h.toString().length < 2 ? "0" + h.toString() : h.toString();

    String minuteLeft = m.toString().length < 2 ? "0" + m.toString() : m.toString();

    String secondsLeft = s.toString().length < 2 ? "0" + s.toString() : s.toString();

    String result = "$hourLeft:$minuteLeft:$secondsLeft";

    return result;
  }

  // static String convertDateStringToNameDayMonth(String value, {bool withSpacing: false}) {
  //   initializeDateFormatting('id');
  //   final DateTime currentDate = DateTime.parse(value);
  //   String formatted = '';
  //   if (withSpacing) {
  //     formatted = '${DateFormat.d('id').format(currentDate)}\n${DateFormat.MMM('id').format(currentDate)}\n${DateFormat.y('id').format(currentDate)}';
  //   } else {
  //     formatted = '${DateFormat.d('id').format(currentDate)} ${DateFormat.MMM('id').format(currentDate)} ${DateFormat.y('id').format(currentDate)}';
  //   }
  //   return formatted;
  // }

  static String convertTimeCustomFormatterFromISO(String dateTimeValue, String timePattern, {bool? toWib}) {
    initializeDateFormatting('id_ID');
    var currentTime = DateTime.parse(dateTimeValue);
    if (toWib ?? false) {
      currentTime = currentTime.add(Duration(hours: 7));
    }
    final DateFormat formatter = DateFormat(timePattern, 'id');
    return formatter.format(currentTime);
  }

  static String getMonthNameFromInteger(String dashDate, {bool isWithYear = true, bool isWithMonthName = true, bool isWithyear = true}) {
    List<String> dateConverted = dashDate.split('-');

    return DateFormat('MMMM', 'id').format(DateTime(0, int.parse(dateConverted[1])));
  }

  static bool checkIfTodayFromISO(String dateTimeValue) {
    bool isToday = false;
    final DateFormat formatter = DateFormat('y-M-d', 'id');
    var currentTime = formatter.format(DateTime.parse(dateTimeValue).add(Duration(hours: 7)));
    var now = formatter.format(DateTime.now());

    if (currentTime == now) {
      isToday = true;
    }

    return isToday;
  }
}
