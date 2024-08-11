import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PriceConverter {
  static convert(price) {
    return '₹ ${double.parse('$price').toStringAsFixed(2)}';
  }

  static convertRound(price) {
    return '₹ ${double.parse('$price').toInt()}';
  }

  static convertToNumberFormat(num price) {
    final format = NumberFormat("#,##,##,##0.00", "en_IN");
    return '₹ ${format.format(price)}';
  }
}

String getStringFromList(List<dynamic>? data) {
  String str = data.toString();
  return data.toString().substring(1, str.length - 1);
}

// Import your custom date formatters and converters if not already imported
// Extension on String for various operations
extension StringExtensions on String? {
  // Capitalize the first letter of the string
  String get inCaps =>
      isValid ? (this![0].toUpperCase() + this!.substring(1)) : '';

  // Capitalize the first letter of each word in the string
  String get capitalizeFirstOfEach =>
      isValid ? (this!.split(" ").map((str) => str.inCaps).join(" ")) : '';

  // Check if the string is valid (not null and not empty)
  bool get isValid => this != null && this!.isNotEmpty;

  // Check if the string matches the email pattern
  bool get isEmail => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this!);

  // Get initials from a name
  String get initials {
    if (isValid) {
      var list = this!.trim().split(' ');
      return (list.first.isValid ? list.first[0] : '') +
          (list.length > 1 && list.last.isValid ? list.last[0] : '');
    }
    return '';
  }

  // Remove all whitespace from the string
  String get removeAllWhitespace => isValid ? this!.replaceAll(' ', '') : this!;

  // Convert string to a valid URL
  String get url => isValid
      ? (this!.startsWith('http') ||
              this!.startsWith('https') ||
              this!.startsWith('www.')
          ? this!
          : 'https://$this')
      : '';

  // Get file extension from a file path or URL
  String get extension => isValid
      ? this!.split('/').last.split('.').last.length > 5
          ? 'jpg'
          : this!.split('/').last.split('.').last
      : '';

  // Get file name from a file path or URL
  String get fileName => isValid ? this!.split('/').last : '';
}

// Extensions on DateTime for date-related operations
extension DateTimeExtensions on DateTime {
  // Check if the date is today
  bool get isToday =>
      DateFormat('dd MMM yyyy').format(this) ==
      DateFormat('dd MMM yyyy').format(DateTime.now());

  // Check if the date is yesterday
  bool get isYesterday =>
      DateFormat('dd MMM yyyy').format(this) ==
      DateFormat('dd MMM yyyy')
          .format(DateTime.now().subtract(const Duration(days: 1)));

  // Get age based on the current date
  int get getAge => DateTime.now().difference(this).inDays ~/ 365;

  // Compare dates formatted as strings
  bool compareDate(DateTime date) =>
      DateFormat('dd MMM yyyy').format(this) ==
      DateFormat('dd MMM yyyy').format(date);

  // Get time formatted as 'Today', 'Yesterday', or date
  String get getTimeIfToday {
    if (isToday) {
      return 'Today';
    } else if (isYesterday) {
      return 'Yesterday';
    } else {
      return DateFormat('dd MMM yyyy').format(this);
    }
  }
}

// Extension on List<T> for list operations
extension ListExtensions<T> on List<T> {
  // Get sum of elements in the list (assuming elements can be parsed as int)
  int get getSum => isEmpty
      ? 0
      : map((element) => int.tryParse('$element') ?? 0)
          .reduce((sum, element) => sum + element);

  // Format list of names as a comma-separated string with ellipsis for more than 3 names
  String get getNamesPlus => length > 3
      ? '${sublist(0, 3).join(', ')} + ${length - 3} more'
      : join(', ');

  // Get comma-separated string representation of the list
  String get commaSeparated => join(', ');
}

// Extension on Color for adjusting brightness
extension ColorBrightness on Color {
  // Darken the color by a specified amount (0 to 1)
  Color darken([double amount = .1]) => HSLColor.fromColor(this)
      .withLightness(
          (HSLColor.fromColor(this).lightness - amount).clamp(0.0, 1.0))
      .toColor();

  // Lighten the color by a specified amount (0 to 1)
  Color lighten([double amount = .1]) => HSLColor.fromColor(this)
      .withLightness(
          (HSLColor.fromColor(this).lightness + amount).clamp(0.0, 1.0))
      .toColor();
}

// Extension on Map for converting key-value pairs to query parameters
extension GetRequest on Map {
  // Convert map to query string for GET request
  String get convertGetResponseUrl =>
      keys.map((key) => '$key=${this[key]}').join('&');
}

// Extension on BuildContext for easier access to theme and media query
extension Context on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).primaryColor;

  double get bottomViewInsets => MediaQuery.of(this).viewInsets.bottom;
}

// Class for date formatting
class DateFormatters {
  DateFormat yMD = DateFormat('yyyy-MM-dd');
  DateFormat mD = DateFormat('MMMM dd');
  DateFormat dM = DateFormat('dd MMMM');
  DateFormat hMA = DateFormat('hh:mm a');
  DateFormat hMs = DateFormat('hh:mm:ss');
  DateFormat ms = DateFormat('mm:ss');
  DateFormat dMy = DateFormat('dd MMM yyyy');
  DateFormat My = DateFormat('MMMM yyyy');
  DateFormat dM2 = DateFormat('dd MMM');
  DateFormat dMyDash = DateFormat('dd-MM-yyyy');
  DateFormat dMonthYear = DateFormat('dd MMMM yyyy');
  DateFormat dateTime = DateFormat('dd MMM yyyy, hh:mm a');
  DateFormat dayDMY = DateFormat('EEE,  dd MMM yyyy');
  DateFormat dayDateTime = DateFormat('EEE,  dd MMM yyyy, hh:mm a');
  DateFormat day = DateFormat('EEE');
  DateFormat dayDate = DateFormat('EEE, dd');
  DateFormat dateDay = DateFormat('dd, EEEE');
  DateFormat month = DateFormat('MMMM');
  DateFormat date = DateFormat('dd');

  // Determine week number based on the date
  String week(DateTime dateTime) {
    if (dateTime.day < 8) {
      return '1';
    }
    if (dateTime.day < 15) {
      return '2';
    }
    if (dateTime.day < 22) {
      return '3';
    }
    return '4';
  }
}

// Function to get difference in days between two dates
double getDifferenceInDays({required DateTime date, DateTime? currentDate}) {
  DateTime dateTimeNow = currentDate ?? DateTime.now();
  int differenceInDays = date.difference(dateTimeNow).inDays;
  return differenceInDays.toDouble();
}

// Function to format a time slot between two DateTime objects
String getSlotTime({required DateTime one, required DateTime two}) {
  return "${DateFormat('hh:mm a').format(one)} - ${DateFormat('hh:mm a').format(two)}";
}

// Function to compare dates with or without considering the year
bool compareDates(
    {required DateTime one,
    required DateTime two,
    bool year = true,
    bool logData = false}) {
  if (logData) {
    log("${DateFormat('dd MMM yyyy').format(one)}  ${DateFormat('dd MMM yyyy').format(two)}");
  }
  return year
      ? DateFormat('dd MMM yyyy').format(one) ==
          DateFormat('dd MMM yyyy').format(two)
      : DateFormat('dd MMM').format(one) == DateFormat('dd MMM').format(two);
}

// Function to get current date and time
DateTime getDateTime() {
  return DateTime.now();
}
