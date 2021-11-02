import 'package:flutter/material.dart';

class DiningModePage extends StatefulWidget {
  @override
  _DiningModePageState createState() => _DiningModePageState();

  // const AuthPage({
  //   Key? key,
  //   required this.data,
  // }) : super(key: key);
}

class _DiningModePageState extends State<DiningModePage> {
  @override
  void initState() {
    super.initState();
    // Provider.of<HomeViewModel>(context, listen: false).fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dining Mode Page!'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'p4 dining mode page',
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
