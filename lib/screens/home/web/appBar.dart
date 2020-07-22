import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/screens/login/sign_in_screen.dart' deferred as signIn;
import 'package:movies/screens/map/map_screen.dart' deferred as map;

import 'default_button.dart';
import 'menu_item.dart';


class CustomAppBar extends StatelessWidget {
  Future loadSignInScreen(context) async {
    await signIn.loadLibrary();
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => signIn.SignInScreen())
    );
  }

  Future loadMapScreen(context) async {
    await map.loadLibrary();
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => map.MapScreen())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.16),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 5),
          Text(
            "MOVIES",
            style: TextStyle(
                fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Spacer(),
          DefaultButton(
            text: "In Theaters",
            press: () {},
          ),
          MenuItem(
            title: "Find Shop",
            press: () {
              loadMapScreen(context);
            },
          ),
          MenuItem(
            title: "Your Account",
            press: () {
              loadSignInScreen(context);
            },
          ),
        ],
      ),
    );
  }
}
