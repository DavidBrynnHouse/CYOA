import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    CollectionReference users = firestore.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'test': 'test' // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.amber[colorCodes[index]],
              child: Column(
                children: [
                  Text("author"),
                  Text("Story"),
                  TextButton(
                    onPressed: () {},
                    child: Text("Comments"),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addUser();
          // Navigator.pushNamed(context, '/post');
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
