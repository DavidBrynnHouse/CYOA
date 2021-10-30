import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Choose your adventure')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Left'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Right'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
