import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:covidwatch/MyStatusPage.dart';
import 'package:covidwatch/SafeZonesPage.dart';
import 'package:covidwatch/MyContacts.dart';
import 'package:covidwatch/StatsPage.dart';
import 'package:covidwatch/NewsPage.dart';

enum NavigationEvents{
  MyStatusPageClicked,
  SafeZonesPageClicked,
  MyContactsPageClicked,
  StatsPageClicked,
  NewsPageClicked,
}
abstract class NavigationStates{}

class NavigationBloc extends Bloc<NavigationEvents,NavigationStates>{
  NavigationStates get initialState=> MyStatus();
  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async*{
    switch(event){
      case NavigationEvents.MyStatusPageClicked: yield MyStatus();
      break;
      case NavigationEvents.SafeZonesPageClicked:yield SafeZones();
      break;
      case NavigationEvents.MyContactsPageClicked:yield MyContacts();
      break;
      case NavigationEvents.StatsPageClicked:yield Stats();
      break;
      case NavigationEvents.NewsPageClicked:yield News();
    }
  }
}