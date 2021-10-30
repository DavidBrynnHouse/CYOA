import 'package:flutter/material.dart';
import '../models/story_arguments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as StoryArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(args.title),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(args.firstOption),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(args.secondOption),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
