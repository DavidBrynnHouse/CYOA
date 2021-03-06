import 'package:cyoa/models/story_arguments.dart';
import 'package:cyoa/screens/post.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
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
        .doc(loggedinUser.uid)
        .collection('userPosts')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        titles.add(doc['title']);
        authors.add(doc['author']);
        beginnings.add(doc['beginning']);
        firstOptions.add(doc['firstOption']);
        secondOptions.add(doc['secondOption']);
        firstEndings.add(doc['firstEnding']);
        secondEndings.add(doc['secondEnding']);
      }
      setState(() {});
    });
  }

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
        getPosts();
      }
    } catch (e) {
      print(e);
    }
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
            print('Something!!!!!!!!');
            if (titles.isEmpty) {
              return const Center(
                child:
                    Text('Click the plus button to write your own adventure!'),
              );
            } else {
              print(titles.length);
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/story',
                    arguments: StoryArguments(
                      titles[index],
                      authors[index],
                      beginnings[index],
                      firstOptions[index],
                      secondOptions[index],
                      firstEndings[index],
                      secondEndings[index],
                    ),
                  );
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        titles[index],
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("By: ${authors[index]}"),
                    ),
                  ],
                ),
              );
            }
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
