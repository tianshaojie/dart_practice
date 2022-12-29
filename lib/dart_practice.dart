library dart_practice;

import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:sprintf/sprintf.dart';

class Calculator {
  String str = "test";
  /// Returns [value] plus 1.
  // int addOne(int value) => value + 1;
}

void main() {

  Calculator calculator = Calculator();
  String str = jsonEncode(calculator);
  print(str);

  // formatToChartTime("20221227162005");

  DateFormat format = DateFormat("hh:mm");
  int millisecondsOpenTime = 5400000;
  String dateTime = "20221227162005";

  // print(DateFormat('yyyy-MM-dd hh:mm:ss').parse(dateTime).microsecondsSinceEpoch);
  // print(DateFormat('yyyy-MM-dd hh:mm').parse(dateTime).microsecondsSinceEpoch);

  DateTime dt = yyyyMMddHHmmss2DateTime(dateTime);
  print(dt.millisecondsSinceEpoch/1000);
  print(dt.millisecondsSinceEpoch/1000 - dt.second);
  print(DateFormat('yyyy-MM-dd hh:mm').format(dt));

  // DateFormat formatDay = DateFormat("yyyyMMdd");
  // formatDay.parse(dateTime);

  // String hhmm = formatToChartTime(dateTime);
  // print("hhmm time = $hhmm");
  //
  // DateTime date = DateTime.fromMillisecondsSinceEpoch(millisecondsOpenTime);
  // print(date.millisecondsSinceEpoch);

  // isOutOfTradeTime(millisecondsOpenTime, dateTime);
  //
  // String openTime = "09:30";
  // DateFormat format = DateFormat("hh:mm");
  // int time = format.parse(openTime).millisecondsSinceEpoch;
  // print(time);
  //
  //
  // DateTime zeroTime = DateTime.now();
  // String zt = format.format(zeroTime);
  // DateTime nowTime = format.parse(zt);
  // print(nowTime.millisecondsSinceEpoch);


  // DateFormat format = DateFormat("hhmm");
  // DateTime zeroTime = DateTime.now();
  // String zt = format.format(zeroTime);
  // print(zt);


  // DateTime now = DateTime.now();
  // String formattedTime = DateFormat.Hms().format(now);
  // String formattedDayTime = DateFormat('yyyy-MM-dd hh:mm:ss').format(now);
  // print("formattedDayTime=$formattedDayTime");
  // String formattedDay = DateFormat('yyyyMMdd').format(now);
  // String formattedTime1 = DateFormat('hh:mm:ss').format(now);
  // print("formattedTime=$formattedTime");
  // print("formattedTime1=$formattedTime1");
  // print("formattedDay=$formattedDay");
}

// String date = '20221227162005';
DateTime yyyyMMddHHmmss2DateTime(String date) {
  String dateWithT = date.substring(0, 8) + 'T' + date.substring(8);
  DateTime dateTime = DateTime.parse(dateWithT);
  return dateTime;
}

/**
 * 判断时间是否在开盘之前
 *
 * @param openTime
 * @param dateTime
 * @return
 */
bool isOutOfTradeTime(int openTime, String dateTime) {
  DateFormat format = DateFormat("hh:mm");
  DateTime zeroTime = DateTime.now();
  String zt = format.format(zeroTime);
  DateTime? nowTime = null;
  try {
    nowTime = format.parse(zt);
  } catch (e) {
    print(e);
  }

  try {
    nowTime = format.parse(Stringinsert(formatToChartTime(dateTime), ":", 2));
  } catch (e) {
    print(e);
  }
  int nowTimeL = nowTime!.millisecondsSinceEpoch;
  return nowTimeL < openTime;
}

/**
 * 将时间转到分，用于计算分时根数
 *
 * @param mainTime
 * @return
 */
String formatToChartTime(String mainTime) {
  if (mainTime.length >= 12) {
    String ss = mainTime.substring(12);
    print(ss);
    if (int.parse(ss) > 0) { //秒大于0
      String dateWithT = '${mainTime.substring(0, 8)}T${mainTime.substring(8)}';
      DateTime dateTime = DateTime.parse(dateWithT);
      dateTime = dateTime.add(const Duration(minutes: 1));
      String hm = DateFormat.Hm().format(dateTime);
      hm = hm.replaceAll(":", "");
      print(hm);
      return hm;
    }
    mainTime = mainTime.substring(8, 12);
  }
  return mainTime;
}

void testSprintf() {
  String str = sprintf("%08d", [111]);
  print(str);
}

void testDateTime() {
  String date = '20180626170555';
  String dateWithT = date.substring(0, 8) + 'T' + date.substring(8);
  DateTime dateTime = DateTime.parse(dateWithT);
  print(dateTime.toString());

  // String date1 = '20180626170555';
  // DateFormat format = DateFormat("yMdHms");
  // DateTime formatDate = format.parse(date1);
  // print(formatDate.toString());
}

String Stringinsert(String a, String b, int t) {
  String aa = a.substring(0, t);
  String bb = a.substring(t, a.length);
  return aa + b + bb;
}