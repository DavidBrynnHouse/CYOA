import 'package:cyoa/screens/ending.dart';
import 'package:cyoa/screens/story.dart';
import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/welcome.dart';
import 'screens/register.dart';
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
      title: 'Adventure Addict',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegistrationScreen(),
        '/feed': (context) => FeedPage(title: 'CYOA'),
        '/post': (context) => PostPage(title: 'CYOA'),
        '/story': (context) => StoryPage(title: 'CYOA'),
        '/ending': (context) => EndingPage(title: 'CYOA')
      },
    );
  }
}
