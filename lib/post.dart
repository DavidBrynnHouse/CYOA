import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final beginningController = TextEditingController();
  final firstOptionController = TextEditingController();
  final secondOptionController = TextEditingController();
  final firstEndingController = TextEditingController();
  final secondEndingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference newPost = FirebaseFirestore.instance
        .collection('posts')
        .doc('THISISAFAKEUSER')
        .collection('userPosts');
    Future<void> addPost() {
      return newPost
          .add({
            'beginning': beginningController.text,
            'firstOption': firstOptionController.text,
            'secondOption': secondOptionController.text,
            'firstEnding': firstEndingController.text,
            'secondEnding': secondEndingController.text
          })
          .then((value) => print("Post Added"))
          .catchError((error) => print("Failed to add post: $error"));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            EnterStoryWidget(
              text: 'Start writing your story here',
              controller: beginningController,
            ),
            Row(
              children: [
                Container(
                  child: EnterStoryWidget(
                    text: 'Enter first option',
                    controller: firstOptionController,
                  ),
                  width: MediaQuery.of(context).size.width / 2,
                ),
                Container(
                  child: EnterStoryWidget(
                    text: "Enter second option",
                    controller: secondOptionController,
                  ),
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: EnterStoryWidget(
                    text: 'Enter first ending',
                    controller: firstEndingController,
                  ),
                  width: MediaQuery.of(context).size.width / 2,
                ),
                Container(
                  child: EnterStoryWidget(
                    text: "Enter Second Ending",
                    controller: secondEndingController,
                  ),
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                addPost();
                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}

class EnterStoryWidget extends StatelessWidget {
  const EnterStoryWidget({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);

  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        maxLines: null,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: text,
          isDense: true, // Added this
          contentPadding: const EdgeInsets.all(25),
        ),
      ),
    );
  }
}
