import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

late User loggedinUser;

class PostPage extends StatefulWidget {
  const PostPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _auth = FirebaseAuth.instance;
  final titleController = TextEditingController();
  final beginningController = TextEditingController();
  final firstOptionController = TextEditingController();
  final secondOptionController = TextEditingController();
  final firstEndingController = TextEditingController();
  final secondEndingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  //using this function you can use the credentials of the user
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
        print(loggedinUser.displayName);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference newPost = FirebaseFirestore.instance
        .collection('posts')
        .doc(loggedinUser.uid)
        .collection('userPosts');
    Future<void> addPost() {
      return newPost
          .add({
            'title': titleController.text,
            'beginning': beginningController.text,
            'firstOption': firstOptionController.text,
            'secondOption': secondOptionController.text,
            'firstEnding': firstEndingController.text,
            'secondEnding': secondEndingController.text,
            'author': loggedinUser.displayName ?? 'Anonymous'
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
              text: 'Name your story',
              controller: titleController,
            ),
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
            ElevatedButton(
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
