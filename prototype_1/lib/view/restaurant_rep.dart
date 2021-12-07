import 'package:flutter/material.dart';
import './home_page.dart';
import 'dart:async';
import 'dart:io';
import 'package:prototype_1/view_model/role_reg_view_model.dart';
import 'package:provider/provider.dart';

class RestaurantRepPage extends StatefulWidget {
  @override
  _RestaurantRepPageState createState() => _RestaurantRepPageState();

  // const AuthPage({
  //   Key? key,
  //   required this.data,
  // }) : super(key: key);
}

class _RestaurantRepPageState extends State<RestaurantRepPage> {
  final _restaurantController = TextEditingController();
  final _menuController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Provider.of<HomeViewModel>(context, listen: false).fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Rep Registration'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.26,
                  child: Text(
                    'Enter Restaurant Information',
                    style: TextStyle(fontSize: 49),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _restaurantController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Restaurant Name',
                    hintText: 'Enter the name of your restuarant'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _menuController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Link to Menu',
                    hintText: 'Enter the link to your menu'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.125,
                width: MediaQuery.of(context).size.width * 1,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: MaterialButton(
                  onPressed: () {
                    continue_home_page();
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (_) => HomePage()));
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  continue_home_page() {
    //call viewmodel here to save link

    Provider.of<RoleRegViewModel>(context, listen: false).registerRestaurant(_restaurantController.text, _menuController.text);

    //dont need to check for next page here

    Navigator.pop(context);
  }
}
