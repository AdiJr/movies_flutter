import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movies/services/movieAPI.dart' deferred as movieAPI;
import 'home/home_screen.dart' deferred as homeScreen;

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getMovieData();
  }

  void getMovieData() async {
    await movieAPI.loadLibrary();
    var movieData = await movieAPI.MovieModel().getNowPlaying();
    moveToHomeScreen(context, movieData);
  }

  Future moveToHomeScreen(context, movieData) async {
    await homeScreen.loadLibrary();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return homeScreen.HomeScreen(
          movieData: movieData,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.pink,
          size: 100.0,
        ),
      ),
    );
  }
}
