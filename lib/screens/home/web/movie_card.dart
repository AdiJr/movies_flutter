import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/constants.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/screens/details/details_screen.dart';

class MovieCard extends StatelessWidget {
  final Result movie;

  const MovieCard({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        closedBuilder: (context, action) => buildCard(context),
        openBuilder: (context, action) => DetailsScreen(movie: movie),
      ),
    );
  }

  Column buildCard(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [defaultShadow],
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(imagesBaseUrl + movie.posterPath),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: defaultPadding / 2),
          child: Text(
            movie.title,
            style: TextStyle(
                fontSize: 20, color: Colors.pink, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/icons/star_fill.svg",
              height: 20,
            ),
            SizedBox(width: defaultPadding / 2),
            Text(
              "${movie.voteAverage}",
              style: Theme.of(context).textTheme.bodyText2,
            )
          ],
        )
      ],
    );
  }
}
