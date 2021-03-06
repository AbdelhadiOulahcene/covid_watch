import 'dart:async';

import 'package:covidwatch/Login.dart';
import 'package:covidwatch/MenuItem.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc_navigation/navigation_bloc.dart';



class SideBar extends StatefulWidget {
  final UserInfoDetails user;

  const SideBar({Key key, this.user}) : super(key: key);
  @override
  _SideBarState createState() => _SideBarState();

}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  String username;
  final _animationDuration=const Duration(milliseconds: 500 );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    username=widget.user.displayName;
    _animationController=AnimationController(vsync: this,duration: _animationDuration);
    isSidebarOpenedStreamController=PublishSubject<bool>();
    isSidebarOpenedStream=isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink=isSidebarOpenedStreamController.sink;
  }
  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    final myController=TextEditingController();
    final screenWidth=MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context,isSidebarOpenedAsync){
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSidebarOpenedAsync.data? 0 : -screenWidth,
          right: isSidebarOpenedAsync.data? 0 : screenWidth-30,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.black,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color.fromRGBO(252,92,125,1),Color.fromRGBO(106,130,251,1)]
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 70,),
                            new Container(
                                width: MediaQuery.of(context).size.width*0.3,
                                height: MediaQuery.of(context).size.width*0.3,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new NetworkImage(widget.user.photoUrl)
                                    )
                                )),
                            SizedBox(height: 15,),
                            Text(username,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w800),),
                            SizedBox(height: 5,),
                            InkWell(
                              child: Text("Click here to change your username",style: TextStyle(fontSize: 10,color: Colors.deepOrange),),
                              onTap: (){
                                return showDialog(
                                  context: context,
                                  child: Center(
                                    child: AlertDialog(
                                      title: Text("Change username"),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: <Widget>[
                                            Text("Veuillez mettre votre nom et prenom"),
                                            TextField(controller: myController,)
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Save"),
                                          onPressed: (){
                                            setState(() {
                                              username=myController.text;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: "My Status",
                        onTap: (){
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyStatusPageClicked);
                        },
                      ),
                      MenuItem(
                        icon: Icons.location_on,
                        title: "Safe Zones",
                        onTap: (){
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.SafeZonesPageClicked);
                        },
                      ),
                      MenuItem(
                        icon: Icons.group,
                        title: "My Contacts",
                        onTap: (){
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyContactsPageClicked);
                        },
                      ),
                      MenuItem(
                        icon: Icons.assessment,
                        title: "Statistics",
                        onTap: (){
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.StatsPageClicked);
                        },
                      ),

                      MenuItem(
                        icon: Icons.description,
                        title: "News",
                        onTap: (){
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.NewsPageClicked);
                        },
                      ),
                      MenuItem(
                        icon: Icons.exit_to_app,
                        title: "Sign Out",
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),

                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0,-1),
                child: GestureDetector(
                  onTap: (){
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 30,
                      height: 120,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color.fromRGBO(106,130,251,1),Color.fromRGBO(106,130,251,0.7)]
                          )),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void onIconPressed() {
    final animationStatus=_animationController.status;
    final isAnimationComplete=animationStatus==AnimationStatus.completed;
    if(isAnimationComplete){
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    }else{
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }
}
class CustomMenuClipper extends CustomClipper<Path>
{
  @override
  Path getClip(Size size) {
    Paint paint=Paint();
    paint.color=Colors.white;

    final width=size.width;
    final height=size.height;

    Path path=Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width-1, height/2-20, width, height/2);
    path.quadraticBezierTo(width+1, height/2+20, 10, height-16);
    path.quadraticBezierTo(0, height-8, 0, height);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
