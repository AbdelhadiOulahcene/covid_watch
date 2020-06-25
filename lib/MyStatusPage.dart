import 'package:covidwatch/StatsPage.dart';
import 'package:covidwatch/bloc/bloc_navigation/navigation_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyStatus extends StatefulWidget with NavigationStates {
  @override
  _MyStatusState createState() => _MyStatusState();
}

class _MyStatusState extends State<MyStatus> {
  int _etat=0;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10,),
                  Text("My Status",style: TextStyle(color: Colors.white,fontSize: 25),),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              Container(
                width: width*0.9,
                height: MediaQuery.of(context).size.height*0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.grey.withOpacity(0.2)
                ),
                child:getChildren(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              Container(
                width: width*0.9,
                height: MediaQuery.of(context).size.height*0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.grey.withOpacity(0.2)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: getTile()
                      ),
                      IconButton(
                        iconSize:40,
                        color: Colors.white,
                        icon: Icon(Icons.arrow_forward),
                        onPressed: (){
                          setState(() {
                            _etat++;
                            if(_etat>2){
                              _etat=0;
                            }
                          });
                        },
                      )
                    ],
                  ),
                )
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              Container(
                  width: width*0.9,
                  height: MediaQuery.of(context).size.height*0.12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey.withOpacity(0.2)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Report a case",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                              Text("Lorum ipsum dolor sit amet consetetur sadipscing elitdw.",style: TextStyle(color: Colors.white,fontSize: 12),),
                            ],
                          ),
                        ),
                        IconButton(
                          iconSize:40,
                          color: Colors.white,
                          icon: Icon(Icons.arrow_forward),
                          onPressed: (){},
                        )
                      ],
                    ),
                  )
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              Expanded(
                child: Container(
                    width: width*0.9,
                    height: MediaQuery.of(context).size.height*0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.grey.withOpacity(0.2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("Statistics",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    child: Text("See more",style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),),
                                    onTap: (){
                                      BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.StatsPageClicked);
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
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
                          )
                        ],
                      )
                    )
                ),
              ),

            ],
          ),
        ),
      ),

      color: Colors.black,
    );
  }
  Widget getChildren(){
    switch(this._etat){
      case 0: return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Image.asset("assets/images/qr_green.png",height: MediaQuery.of(context).size.height*0.15,)
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("You are in a good health",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
            ),
          ],
        );
      break;
      case 1: return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Image.asset("assets/images/qr_green.png",height: MediaQuery.of(context).size.height*0.15,color: Colors.orange,)
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("You should get a test",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
          ),
        ],
      );
      break;
      case 2: return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Image.asset("assets/images/qr_green.png",height: MediaQuery.of(context).size.height*0.15,color: Colors.red,)
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("You are Covid-19 positive",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
          ),
        ],
      );
      break;
    }
  }
  Widget getTile(){
    if (_etat==0){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("I have concerns",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          Text("If you feel that you are having some issues that might be due to covid-19 please click on the arrow",style: TextStyle(color: Colors.white,fontSize: 12),),
        ],
      );
    }
    else{
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Submit Covid-19 test",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          Text("You have to pass and submit a covid-19 test",style: TextStyle(color: Colors.white,fontSize: 12),),
        ],
      );
    }
  }
}
