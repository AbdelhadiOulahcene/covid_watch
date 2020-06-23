import 'package:flutter/material.dart';
import 'package:covidwatch/Splashscreen.dart';
import 'package:flutter/services.dart';
import 'package:covidwatch/Login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid Watch',
      home: Splashscreen(),

    );
  }
}



