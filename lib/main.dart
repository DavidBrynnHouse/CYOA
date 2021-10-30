import 'package:cyoa/screens/story.dart';
import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/feed.dart';
import 'screens/post.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/post': (context) => PostPage(title: 'CYOA'),
        '/story': (context) => StoryPage(title: 'CYOA')
      },
    );
  }
}
