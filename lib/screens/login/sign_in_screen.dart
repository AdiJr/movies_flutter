import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/screens/login/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _signInButtonPressed() {}
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign in',
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 40,
          ),
        )
      ),
      backgroundColor: Colors.grey[200],
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SignUpForm(),
              Container(
                margin: EdgeInsets.fromLTRB(0, 14, 0, 0),
                child: Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: Text("Sign up"),
              ),
            ]),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignUpForm> {
  var email = "";
  var password = "";
  var buttonEnabled = false;
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool _emailIsValid() {
    if (email.contains("@") && email.contains(".com") && email.length > 6) {
      return true;
    }
    return false;
  }

  void _enableButtonIfPossible() {
    if (password.length > 4 && _emailIsValid()) {
      buttonEnabled = true;
    } else {
      buttonEnabled = false;
    }
    setState(() {});
  }

  void _singInWithFirebase() async {
      try {
        final user = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        if (user != null) {
          Navigator.pop(context);
        }
      } catch (e) {
        print("whoops something went wrong");
        print(e);
      }

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
            padding: EdgeInsets.all(10),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              if (buttonEnabled) {
                _singInWithFirebase();
              }
            },
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: buttonEnabled ? Colors.blue[100] : Colors.blueGrey[100],
              ),
              padding: EdgeInsets.all(10),
              child: Text('Sign in'),
            ),
          ),
        ],
      ),
    );
  }
}
