import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/cupertino.dart';
import 'package:prototype_1/models/User.dart';
import 'package:amplify_flutter/amplify.dart';

class HomeViewModel with ChangeNotifier {

  List<User> _userList = [];
  var _amplify;

  // HomeViewModel(amplify) {
  //   _amplify = amplify;
  // }

  Future<void> fetchUserData() async {
    try {
      _userList = await Amplify.DataStore.query(User.classType);
    } catch (e) {
      print(e);
    }
    print(_userList.toString());
    notifyListeners();
  }


  List<User> get userList {
    return _userList;
  }
}