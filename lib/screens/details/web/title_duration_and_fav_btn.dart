import 'package:flutter/material.dart';
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
      padding: EdgeInsets.all(defaultPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    movie.title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                SizedBox(height: defaultPadding / 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
