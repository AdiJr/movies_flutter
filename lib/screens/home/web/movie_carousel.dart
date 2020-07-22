import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/constants.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/screens/details/details_screen.dart';

class MovieCarousel extends StatefulWidget {
  MovieCarousel({Key key, this.movies}) : super(key: key);
  final List<Result> movies;

  @override
  _MovieCarouselState createState() => _MovieCarouselState(movies);
}

class _MovieCarouselState extends State<MovieCarousel> {
  final List<Result> movies;
  _MovieCarouselState(this.movies);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 2 * MediaQuery.of(context).size.height / 3,
        viewportFraction: 0.3,
        disableCenter: true,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: Duration(seconds: 2),
      ),
      items: movies.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              child: Container(
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailsScreen(movie: i)),
                    );
                  },
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: NetworkImage(imagesBaseUrl + i.posterPath),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
