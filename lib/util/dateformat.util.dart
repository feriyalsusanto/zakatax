import 'package:date_format/date_format.dart';

class DateFormatUtil {
  static String parseDateTimeLocal(DateTime resource,
      {List<String> dateFormat}) {
    String format = formatDate(
        resource, dateFormat == null ? [dd, '-', mm, '-', yyyy] : dateFormat);
    return format;
  }
}
