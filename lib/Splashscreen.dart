import 'package:covidwatch/Login.dart';
import 'package:flutter/material.dart';
//import './Login.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({
    Key key,}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
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
    print(h);print(w);
    return Scaffold(
      body:SafeArea(
        child:Stack(
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
      ),
      )
    );
  }
}

