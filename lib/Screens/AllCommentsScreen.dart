import 'package:flutter/material.dart';
class AllCommentsScreen extends StatefulWidget {
  const AllCommentsScreen({Key key}) : super(key: key);

  @override
  _AllCommentsScreenState createState() => _AllCommentsScreenState();
}

class _AllCommentsScreenState extends State<AllCommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
        centerTitle: true,
      ),
    );
  }
}
