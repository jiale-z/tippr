import 'package:flutter/material.dart';
import 'package:prototype_1/view_model/home_view_model.dart';
//import 'package:mvvm_flutter_app/model/apis/api_response.dart';

import 'package:provider/provider.dart';

class Dummy extends StatefulWidget {
  @override
  _DummyScreenState createState() => _DummyScreenState();
}

class _DummyScreenState extends State<Dummy> {
  @override
  void initState() {
    super.initState();
    //Fetching user data in viewmodel on the initialization of the first screen
    // listen: false signifies that this reference doesn't need to listen for event
    // changes to the viewmodel because it's a synchronous one time method call, rather
    // than a data read
    Provider.of<HomeViewModel>(context, listen: false).fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy'),
      ),
      body: Column(
        children: <Widget>[
          //Reading the value of the user directly from the viewmodel using Provider
          Text(Provider.of<HomeViewModel>(context).user.toString()),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/2');
              },
              child: const Text('Dining Preferences')),
          ElevatedButton(
              onPressed: () {
                Provider.of<HomeViewModel>(context, listen: false)
                    .createServerLink('123abc');
              },
              child: Text('new LINKSDNFKSDFN')),
          //Using ternary operators to change the content of the screen based on the data
          // available. In this case,
          (Provider.of<HomeViewModel>(context).serverBio != null)
              ? Text(Provider.of<HomeViewModel>(context).serverBio!.bio!)
              : Text('no server')
        ],
      ),
    );
  }
}
