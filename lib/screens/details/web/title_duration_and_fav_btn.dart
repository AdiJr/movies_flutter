import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies/models/movie.dart';
import '../../../constants.dart';

class TitleDurationAndFabBtn extends StatelessWidget {
  const TitleDurationAndFabBtn({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Result movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(400.0, 0.0, 400.0, 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                  child: Text(
                    movie.title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '${new DateFormat.yMMMMd('en_US').format(movie.releaseDate)}',
                      style: TextStyle(color: textLightColor),
                    ),
                    SizedBox(width: defaultPadding),
                    Text(
                      "PG-13",
                      style: TextStyle(color: textLightColor),
                    ),
                    SizedBox(width: defaultPadding),
                    Text(
                      "2h 32min",
                      style: TextStyle(color: textLightColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
