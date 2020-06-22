import 'package:flutter/material.dart';
import 'package:covidwatch/Splashscreen.dart';
import 'package:flutter/services.dart';
import 'package:covidwatch/Login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xFFECF0F1),
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Covid Watch',
      home: Splashscreen(),

    );
  }
}



