import 'package:cyoa/models/ending_arguments.dart';
import 'package:flutter/material.dart';
import '../models/story_arguments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EndingPage extends StatefulWidget {
  const EndingPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<EndingPage> createState() => _EndingPageState();
}

class _EndingPageState extends State<EndingPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as EndingArguments;
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
              child: Text(args.ending),
            ),
          ],
        ),
      ),
    );
  }
}
