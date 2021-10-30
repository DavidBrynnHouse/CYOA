import 'package:cyoa/models/story_arguments.dart';
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
  final List<String> titles = <String>[];
  final List<String> authors = <String>[];
  final List<String> beginnings = <String>[];
  final List<String> firstOptions = <String>[];
  final List<String> secondOptions = <String>[];
  final List<String> firstEndings = <String>[];
  final List<String> secondEndings = <String>[];

  void getPosts() async {
    await FirebaseFirestore.instance
        .collection('posts')
        .doc('THISISAFAKEUSER')
        .collection('userPosts')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        titles.add(doc['title']);
        authors.add(doc['firstEnding']);
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();

    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference posts = firestore.collection('users');
    setState(() {});

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: titles.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // color: Colors.amber[colorCodes[index]],
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/story',
                      arguments: StoryArguments(
                        titles[index],
                        beginnings[index],
                        firstOptions[index],
                        secondOptions[index],
                        firstEndings[index],
                        secondEndings[index],
                      ));
                },
                child: Column(
                  children: [
                    Text(titles[index]),
                    Text("By: ${authors[index]}"),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/post');
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
