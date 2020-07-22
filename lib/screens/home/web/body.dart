import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';

import 'appBar.dart';
import 'movie_carousel.dart';

class BodyWeb extends StatelessWidget {
  final List<Result> movie;

  const BodyWeb({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomAppBar(),
            Spacer(),
            MovieCarousel(movies: movie),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
