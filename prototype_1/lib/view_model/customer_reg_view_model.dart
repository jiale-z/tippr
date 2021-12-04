import 'package:flutter/cupertino.dart';
import 'package:prototype_1/models/ServerBio.dart';
import 'package:prototype_1/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:prototype_1/models/Allergens.dart';
import 'package:prototype_1/models/ModelProvider.dart';
import 'package:provider/provider.dart';
import 'package:prototype_1/view_model/session.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'dart:math';

class CustomerRegViewModel with ChangeNotifier {
  //These are the data fields you will directly access from the Views through Provider.of<PreferenceViewModel>(context).field
  //We use the Session singleton to access the User we already retrieved before
  User? _user = Session().user;
  bool _isCustomerRegComplete = false;
  bool _isRestaurantRegComplete = false;
  bool _isServerRegComplete = false;
  bool _ServerRegError = false;

  //Get methods for necessary fields
  bool get isCustomerRegComplete {
    return _isCustomerRegComplete;
  }

  bool get isRestaurantRegComplete {
    return _isRestaurantRegComplete;
  }

  bool get isServerRegComplete {
    return _isServerRegComplete;
  }

  bool get isServerRegError {
    return _ServerRegError;
  }

  void set isServerRegError(bool newVal) {
    _ServerRegError = newVal;
  }

  //Get methods for necessary fields
  User? get user {
    return _user;
  }

  // called once customer survey is complete, with comm level and allergens list
  // Allergens list is an array (size 9) of booleans with EXACT order as follows
  // [milk, eggs, fish, shellfish, treeNuts, peanuts, wheat, soy, sesame]
  Future<void> registerCustomer(int comLevel, List<bool> allergens) async {
    Customer cust = Customer(
        communicationPreference: comLevel,
        allergens: Allergens(allergens),
        user: _user!);

    try {
      await Amplify.DataStore.save(cust);
      _isCustomerRegComplete = true;
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  Future<void> registerServer(
      String restCode, String? bio, String? imageLink) async {
    ServerBio serverBio = ServerBio(bio, imageLink);
    String restID;

    try {
      var list = await Amplify.DataStore.query(Restaurant.classType,
          where: Restaurant.RESTAURANTCODE.eq(restCode));

      if (list.isEmpty) {
        _ServerRegError = true;
      } else {
        restID = list[0].id;
        Server server =
            Server(user: _user!, restaurantID: restID, bio: serverBio);
        await Amplify.DataStore.save(server);
        _isServerRegComplete = true;
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> registerRestaurant(String title, String menu) async {
    String code = await generateRestaurantCode();
    Restaurant rest = Restaurant(
        title: title, menu: menu, restaurantCode: code, user: _user!);

    try {
      await Amplify.DataStore.save(rest);
      _isRestaurantRegComplete = true;
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  Future<String> generateRestaurantCode() async {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    bool valid = false;
    String temp = '';
    while (!valid) {
      temp =
          List.generate(5, (index) => _chars[r.nextInt(_chars.length)]).join();
      try {
        var list = await Amplify.DataStore.query(Restaurant.classType,
            where: Restaurant.RESTAURANTCODE.eq(temp));
        if (list.isEmpty) {
          valid = true;
        }
      } catch (e) {
        print(e);
      }
    }
    return temp;
  }
}
