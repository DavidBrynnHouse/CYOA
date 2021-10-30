import 'package:flutter/material.dart';
import 'login.dart';
import 'feed.dart';
import 'post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choose Your Own Adventure',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => LoginPage(title: 'CYOA'),
        '/feed': (context) => FeedPage(title: 'CYOA'),
        '/post': (context) => PostPage(title: 'CYOA')
      },
    );
  }
}
