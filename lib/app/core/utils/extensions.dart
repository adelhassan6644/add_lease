import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

//make first letter capital
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
extension CustomContext on BuildContext {
  double screenHeight([double percent = 1]) =>
      MediaQuery.of(this).size.height * percent;

  double screenWidth([double percent = 1]) =>
      MediaQuery.of(this).size.width * percent;
}

extension DataExtention on DateTime {
  String dateFormat() {
    return DateFormat.yMMMd(

    ).format(this);
    // return DateFormat("dd-MMMM ").format(this);
  }
  String dateFormat1() {
    return DateFormat("yyyy-MM-dd",).format(this);
  }
}

extension DataExtention2 on DateTime {

  String dateFormat2() {
    return DateFormat.yMMM(
    ).format(this);
    // return DateFormat("dd-MMMM ").format(this);
  }
}

extension DataTimeExtention on DateTime {
  String dateTimeFormat() {
    return DateFormat("yyyy-MM-dd hh:mm",
    ).format(this);
  }
}

extension IsoDataTimeExtention on DateTime {

  String isoDateTimeFormat() {
    return DateFormat.yMEd(

    ).format(this,);
  }
}

extension TimeExtention on DateTime {
  String timeFormat() {
    return DateFormat("hh:mm a",

    ).format(this);
  }
}

extension TimeExtention2 on DateTime {
  String timeDateFormat() {
    return DateFormat("EE, d MMM, yyyy",

    ).format(this);
  }
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}
