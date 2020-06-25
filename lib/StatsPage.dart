import 'package:covidwatch/bloc/bloc_navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';

class Stats extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10,),
                  Text("Statistics",style: TextStyle(color: Colors.white,fontSize: 25),),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              Row(
                children: <Widget>[
                  Text("Algeria:",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("Last updated: 2h ago",style: TextStyle(color: Colors.white,fontSize: 13 ),)
                    ),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.deepOrange.withGreen(80),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    height: MediaQuery.of(context).size.height*0.14,
                    width: MediaQuery.of(context).size.width/4,
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/virus.png",width:MediaQuery.of(context).size.width*0.1 ,color: Colors.white,),
                        Text("400",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                        Text("Confirmed\ninfections",style: TextStyle(color: Colors.white,fontSize: 12,),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green.withBlue(100),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    height: MediaQuery.of(context).size.height*0.14,
                    width: MediaQuery.of(context).size.width/4,
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/heart.png",width:MediaQuery.of(context).size.width*0.1 ,color: Colors.white,),
                        Text("64",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                        Text("Recovered\ncases",style: TextStyle(color: Colors.white,fontSize: 12,),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    height: MediaQuery.of(context).size.height*0.14,
                    width: MediaQuery.of(context).size.width/4,
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/person.png",width:MediaQuery.of(context).size.width*0.1 ,color: Colors.white,),
                        Text("29",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                        Text("Confirmed \n deaths",style: TextStyle(color: Colors.white,fontSize: 12,),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent.withGreen(112),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    height: MediaQuery.of(context).size.height*0.14,
                    width: MediaQuery.of(context).size.width/4,
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/virus.png",width:MediaQuery.of(context).size.width*0.1 ,color: Colors.white,),
                        Text("300",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                        Text("Active\ncases",style: TextStyle(color: Colors.white,fontSize: 12,),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.orange.withBlue(50),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    height: MediaQuery.of(context).size.height*0.14,
                    width: MediaQuery.of(context).size.width/4,
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/bed.png",width:MediaQuery.of(context).size.width*0.1 ,color: Colors.white,),
                        Text("300",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                        Text("In\nhospital",style: TextStyle(color: Colors.white,fontSize: 12,),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent.withRed(200),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    height: MediaQuery.of(context).size.height*0.14,
                    width: MediaQuery.of(context).size.width/4,
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/location.png",width:MediaQuery.of(context).size.width*0.1 ,color: Colors.white,),
                        Text("29",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                        Text("Near to\nyou ",style: TextStyle(color: Colors.white,fontSize: 12,),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.06,),
              Row(
                children: <Widget>[
                  Text("Global:",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("Last updated: 2h ago",style: TextStyle(color: Colors.white,fontSize: 13 ),)
                    ),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.deepOrange.withGreen(80),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    height: MediaQuery.of(context).size.height*0.14,
                    width: MediaQuery.of(context).size.width/4,
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/virus.png",width:MediaQuery.of(context).size.width*0.1 ,color: Colors.white,),
                        Text("400",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                        Text("Confirmed\ninfections",style: TextStyle(color: Colors.white,fontSize: 12,),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green.withBlue(100),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    height: MediaQuery.of(context).size.height*0.14,
                    width: MediaQuery.of(context).size.width/4,
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/heart.png",width:MediaQuery.of(context).size.width*0.1 ,color: Colors.white,),
                        Text("64",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                        Text("Recovered\ncases",style: TextStyle(color: Colors.white,fontSize: 12,),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    height: MediaQuery.of(context).size.height*0.14,
                    width: MediaQuery.of(context).size.width/4,
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/person.png",width:MediaQuery.of(context).size.width*0.1 ,color: Colors.white,),
                        Text("29",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                        Text("Confirmed \n deaths",style: TextStyle(color: Colors.white,fontSize: 12,),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent.withGreen(112),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    height: MediaQuery.of(context).size.height*0.14,
                    width: MediaQuery.of(context).size.width/4,
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/virus.png",width:MediaQuery.of(context).size.width*0.1 ,color: Colors.white,),
                        Text("300",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                        Text("Active\ncases",style: TextStyle(color: Colors.white,fontSize: 12,),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.orange.withBlue(50),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    height: MediaQuery.of(context).size.height*0.14,
                    width: MediaQuery.of(context).size.width/4,
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/bed.png",width:MediaQuery.of(context).size.width*0.1 ,color: Colors.white,),
                        Text("300",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                        Text("In\nhospital",style: TextStyle(color: Colors.white,fontSize: 12,),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent.withRed(200),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    height: MediaQuery.of(context).size.height*0.14,
                    width: MediaQuery.of(context).size.width/4,
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/location.png",width:MediaQuery.of(context).size.width*0.1 ,color: Colors.white,),
                        Text("29",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                        Text("Near to\nyou ",style: TextStyle(color: Colors.white,fontSize: 12,),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
