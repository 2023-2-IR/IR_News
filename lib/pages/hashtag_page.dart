import 'package:flutter/material.dart';

class HashtagPage extends StatefulWidget {
  final dynamic hashtag;

  const HashtagPage({Key? key, required this.hashtag}) : super(key: key);

  @override
  State<HashtagPage> createState() => _HashtagPageState();
}

class _HashtagPageState extends State<HashtagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.hashtag)),
    );
  }
}
