import 'package:covidwatch/bloc/bloc_navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';

class MyStatus extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("status"),
      ),
    );
  }
}
