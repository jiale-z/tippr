import 'package:flutter/material.dart';

class RestaurantRepPage extends StatefulWidget {
  @override
  _RestaurantRepPageState createState() => _RestaurantRepPageState();

  // const AuthPage({
  //   Key? key,
  //   required this.data,
  // }) : super(key: key);
}

class _RestaurantRepPageState extends State<RestaurantRepPage> {
  @override
  void initState() {
    super.initState();
    // Provider.of<HomeViewModel>(context, listen: false).fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Rep Page!'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'p4 restaurant rep page',
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
