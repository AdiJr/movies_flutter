import 'package:flutter/material.dart';
import 'package:movies/constants.dart';
import 'package:movies/models/movie.dart';

import 'backdrop_rating.dart';
import 'cast_and_crew.dart';
import 'title_duration_and_fav_btn.dart';

class Body extends StatelessWidget {
  final Movie movie;

  const Body({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BackdropAndRating(size: size, movie: movie),
          SizedBox(height: defaultPadding / 2),
          TitleDurationAndFabBtn(movie: movie),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: defaultPadding / 2,
              horizontal: defaultPadding,
            ),
            child: Text(
              "Plot Summary",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              movie.plot,
              style: TextStyle(
                color: Color(0xFF737599),
              ),
            ),
          ),
          CastAndCrew(casts: movie.cast),
        ],
      ),
    );
  }
}
