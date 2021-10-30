import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
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
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Start writing your story here',
                  isDense: true, // Added this
                  contentPadding: EdgeInsets.all(50),
                ),
              ),
            ),
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
