import 'package:apod_daydream/backdrop/backdrop_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APOD Daydream',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 34.0, fontFamily: 'Roboto', color: Colors.white),
          headline2: TextStyle(fontSize: 16.0, fontFamily: 'Roboto', color: Colors.white70),
          headline3: TextStyle(fontSize: 12.0, fontFamily: 'Roboto', color: Colors.white70),
        ),
      ),
      home: const BackdropPage(key: Key("key")), //<--- Our backdrop page
    );
  }
}