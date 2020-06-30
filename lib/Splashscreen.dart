import 'package:covidwatch/Login.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

//import './Login.dart';

class Splashscreen extends StatefulWidget {
  static Map global;
  static var algeria;
  Splashscreen({
    Key key,}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {


   getGlobalStats() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    if(response.statusCode==200){
      Splashscreen.global=json.decode(response.body);
    }
    else {
      print(response.statusCode);
    }
  }
   getAlgeriaStats() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries');
    if(response.statusCode==200){
      Splashscreen.algeria=json.decode(response.body);
    }
    else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 4),(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
      });
  }
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    double h=media.height;
    double w=media.width;
    getGlobalStats();
    getAlgeriaStats();
    return Scaffold(
      body:Stack(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/background.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        Positioned(
            top:h-h/1.35,
            left:w/6,
            right: w/6,
            child: Container(
              width: w/1.5,
              height: h/3.83,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/watch.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        Positioned(
          top: h-h/2.65,
          left: 1,
          right: 1,
          child:Container(
            child:FractionallySizedBox(
              child: Text(
                'A product by',
                style: TextStyle(
                  fontFamily: 'Roboto-Medium',
                  fontSize: 22,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w500,
                  height: 2,
                ),
                textAlign: TextAlign.center,
              ),
            ) ,
          ),
        ),
        Positioned(
            top:h-h/3.3,
            left:w/3.3,
            right:w/3.3,
            child: Container(
              //width: w/2.44,
              height: h/5.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/eyet.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )
      ],
      )
    );
  }
}

