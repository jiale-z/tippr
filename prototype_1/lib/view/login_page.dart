//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:prototype_1/view/registration_page.dart';
import 'package:prototype_1/view_model/login_view_model.dart';
import './home_page.dart';
import 'package:flutter/widgets.dart';
import './dining_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();

  // const AuthPage({
  //   Key? key,
  //   required this.data,
  // }) : super(key: key);
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    //dummyFunc(context);
    // Provider.of<HomeViewModel>(context, listen: false).fetchUserData();
  }

  Future<void> dummyFunc(context) async {
    var ans = await Provider.of<LoginViewModel>(context).getCurrUser();
    if (ans) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DiningPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    //final _emailController = TextEditingController();
    //final _passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Text(
                    'Login to TIPPR',
                    style: TextStyle(fontSize: 50),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _passwordController,
                onChanged: (value) {},
                onSubmitted: (value) {},
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            MaterialButton(
              onPressed: () {
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: MaterialButton(
                onPressed: () {
                  if (_emailController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            title: Text(
                                'Email and Password Fields Cannot Be Empty'));
                      },
                    );
                  } else {
                    login(_emailController.text, _passwordController.text);
                  }
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            TextButton(
                onPressed: () {
                  register();
                },
                child: Text("New to Tippr? Create an Account"))
          ],
        ),
      ),
    );
  }

  login(String email, String password) async {
    //call viewmodel here
    bool loginresults =
        await Provider.of<LoginViewModel>(context, listen: false)
            .login(email, password);
    if (loginresults) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DiningPage()));
    }
  }

  register() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegistrationPage()));
  }
}
