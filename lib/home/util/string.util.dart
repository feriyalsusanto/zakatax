import 'dart:math';

String numberFormat(num number, {int decimal = 0, String decimalPoint = '.', String thousandsSep = ','}) {
  decimal = decimal.abs();

  // parse to string with fixed decimal point, by default using dot
  String roundedNumber = number.abs().toStringAsFixed(decimal);

  // find the dot position
  int dotPosition = roundedNumber.indexOf('.');

  String numberString;
  String decimalString;

  if(dotPosition < 0) {
    numberString = roundedNumber;
    decimalString = '';
  } else {
    // separate number and the decimal
    numberString = roundedNumber.substring(0, dotPosition);
    decimalString = roundedNumber.substring(dotPosition + 1);
  }

  String formattedNumber = '';

  while (numberString.length > 3) {
    // position of last digit
    // 12312412341235
    int threeDigitPos = max(numberString.length - 3, 0);
    // add to formatted number
    formattedNumber = (thousandsSep + numberString.substring(threeDigitPos) + formattedNumber);
    // remove the last 3 digit
    numberString = numberString.replaceRange(threeDigitPos, null, '');
  }

  if(decimal > 0 && decimalString.length < decimal) {
    decimalString.padRight(decimal, '0');
  }

  return (number < 0 ? '-' : '') + numberString + formattedNumber + (decimalString.length > 0 ? decimalPoint + decimalString : '');
}

String transactionFormat(String transactionid) {
  List<String> split = transactionid.split('-');
  return split[0];
}