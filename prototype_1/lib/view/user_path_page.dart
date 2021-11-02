import 'package:flutter/material.dart';

class UserPathPage extends StatefulWidget {
  @override
  _UserPathPageState createState() => _UserPathPageState();

  // const AuthPage({
  //   Key? key,
  //   required this.data,
  // }) : super(key: key);
}

class _UserPathPageState extends State<UserPathPage> {
  @override
  void initState() {
    super.initState();
    // Provider.of<HomeViewModel>(context, listen: false).fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Path Page!'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'p4 user path page',
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
