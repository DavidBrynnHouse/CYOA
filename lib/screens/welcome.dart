import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextButton(
                  child: Text('Log in'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
                TextButton(
                    child: Text('Register'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    }),
              ]),
        ));
  }
}
