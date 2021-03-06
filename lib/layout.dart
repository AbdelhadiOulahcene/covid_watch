import 'package:covidwatch/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:covidwatch/Sidebar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc_navigation/navigation_bloc.dart';

class SidebarLayout extends StatelessWidget{
  final UserInfoDetails userInfoDetails;

  const SidebarLayout({Key key, this.userInfoDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        body: BlocProvider<NavigationBloc>(
          create: (context)=>NavigationBloc(),
          child: Stack(
            children: <Widget>[
              BlocBuilder<NavigationBloc,NavigationStates>(
                builder: (context,navigationState){
                  return navigationState as Widget;
                },
              ),
              SideBar(user:  userInfoDetails,),
            ],
          ),
        )
    );
  }
}