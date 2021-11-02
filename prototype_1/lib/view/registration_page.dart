import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();

  // const AuthPage({
  //   Key? key,
  //   required this.data,
  // }) : super(key: key);
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  void initState() {
    super.initState();
    // Provider.of<HomeViewModel>(context, listen: false).fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page!'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'p4 registration page',
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
