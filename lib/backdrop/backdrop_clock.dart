import 'dart:async';
import 'package:intl/intl.dart';

class BackdropClock {
  static const String HOUR_FORMAT = "HH";
  static const MINUTE_FORMAT = 'mm';
  
  StreamController<String> minuteStream;
  Timer _timer;

  BackdropClock() {
      minuteStream = StreamController<String>();
      _updateTime();
  }

  void _updateTime() {
    DateTime _dateTime = DateTime.now();

    final hour = DateFormat(HOUR_FORMAT).format(_dateTime);
    final minute = DateFormat(MINUTE_FORMAT).format(_dateTime);
    minuteStream.add("$hour:$minute");

    _timer = Timer(
      Duration(minutes: 1) -
          Duration(seconds: _dateTime.second) -
          Duration(milliseconds: _dateTime.millisecond),
          _updateTime
    );  
  }

  void close() {
    minuteStream.close();
    _timer.cancel();
  }
}