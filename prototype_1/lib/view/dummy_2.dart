import 'package:flutter/material.dart';
import 'package:prototype_1/view_model/preference_view_model.dart';
//import 'package:mvvm_flutter_app/model/apis/api_response.dart';

import 'package:provider/provider.dart';

class Dummy2 extends StatefulWidget {
  @override
  _Dummy2ScreenState createState() => _Dummy2ScreenState();
}

class _Dummy2ScreenState extends State<Dummy2> {
  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<HomeViewModel>(context, listen: false).fetchUserData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy2'),
      ),
      body: Column(
        children: <Widget>[
          Text(Provider.of<PreferenceViewModel>(context).user.toString()),
        ],
      ),
    );
  }
}
