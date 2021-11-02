import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();

  // const AuthPage({
  //   Key? key,
  //   required this.data,
  // }) : super(key: key);
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    // Provider.of<HomeViewModel>(context, listen: false).fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page!'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'p4 login page',
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
