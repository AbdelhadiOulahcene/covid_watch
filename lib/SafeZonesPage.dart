import 'package:covidwatch/bloc/bloc_navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';

class SafeZones extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("safe zones"),
      ),
    );
  }
}
