import 'package:flutter/material.dart';
import 'package:movies/constants.dart';

import 'categories.dart';
import 'genres.dart';
import 'movie_carousel.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Categorylist(),
          Genres(),
          SizedBox(height: defaultPadding),
          MovieCarousel(),
        ],
      ),
    );
  }
}
