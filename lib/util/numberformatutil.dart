import 'package:zakatax/util/string.util.dart';

class NumberFormatUtil {
  static String currencyFormat(int resource) {
    return numberFormat(resource, decimalPoint: ',', thousandsSep: '.');
  }
}
