import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/screens/login/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _signInButtonPressed() {}
    return Scaffold(
      appBar: AppBar(
        title: Text(
        'Sign up',
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 40,
        ),
      ),
      ),
      backgroundColor: Colors.grey[200],
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SignUpForm(),
            ]),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _usernameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  var buttonEnabled = false;
  var username = "";
  var email = "";
  var password = "";

  bool _emailIsValid() {
    if (email.contains("@") && email.contains(".com") && email.length > 6) {
      return true;
    }
    return false;
  }
  bool _usernameIsValid() {
    if (username.contains("@") || username.contains(".com")){
      return false;
    }
    if (username.length == 0 || username.contains(" ")) {
      return false;
    }

    return true;
  }

  void _enableButtonIfPossible() {
    if (_emailIsValid() && password.length > 4 && _usernameIsValid()) {
      buttonEnabled = true;
    } else {
      buttonEnabled = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
            child: TextField(
              onChanged: (username) {
                this.username = username;
                _enableButtonIfPossible();
              },
              controller: _usernameTextController,
              decoration: InputDecoration(
                hintText: 'username',
                hintStyle: TextStyle(color: Colors.grey[400]),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey[200]),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey[900]),
                ),
              ),
              style: TextStyle(
                color: Colors.blueGrey[600],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
            child: TextField(
              onChanged: (email) {
                this.email = email;
                _enableButtonIfPossible();
              },
              controller: _emailTextController,
              decoration: InputDecoration(
                hintText: 'email',
                hintStyle: TextStyle(color: Colors.grey[400]),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey[200]),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey[900]),
                ),
              ),
              style: TextStyle(
                color: Colors.blueGrey[600],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
            child: TextField(
              onChanged: (password) {
                this.password = password;
                _enableButtonIfPossible();
              },
              obscureText: true,
              controller: _passwordTextController,
              decoration: InputDecoration(
                hintText: 'password',
                hintStyle: TextStyle(color: Colors.grey[400]),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey[200]),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey[900]),
                ),
              ),
              style: TextStyle(
                color: Colors.blueGrey[600],
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
            },
            padding: EdgeInsets.all(10),
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: buttonEnabled ? Colors.blue[100] : Colors.blueGrey[100],
              ),
              padding: EdgeInsets.all(10),
              child: Text('Sign up'),
            ),
          ),
        ],
      ),
    );
  }
}
