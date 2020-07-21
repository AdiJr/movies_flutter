import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/screens/map/mobile/map_screen.dart';
import 'package:movies/screens/map/web/map_screen.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.pink));

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: MapScreenMobile(),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            body: mapScreenWeb(),
          );
        }
      },
    );
  }
}
