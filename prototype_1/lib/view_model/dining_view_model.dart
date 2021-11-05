import 'package:flutter/cupertino.dart';
import 'package:prototype_1/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:prototype_1/models/Allergens.dart';
import 'package:prototype_1/models/ModelProvider.dart';
import 'package:provider/provider.dart';
import 'package:prototype_1/view_model/session.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class DiningViewModel with ChangeNotifier {
  //These are the data fields you will directly access from the Views through Provider.of<PreferenceViewModel>(context).field
  //We use the Session singleton to access the User we already retrieved before
  User? _user = Session().user;
  Customer? _customer;
  Restaurant? _restaurant;
  // Perhaps unnecessary since just an attribute of restaurant
  List<Server>? _servers;

  //Get methods for necessary fields
  User? get user {
    return _user;
  }

  Customer? get customer {
    return _customer;
  }

  Restaurant? get restaurant {
    return _restaurant;
  }

  List<Server>? get servers {
    return _servers;
  }
  // This should be called on page initialization (initState function)
  Future<void> fetchUserData() async {
    try {
      var list = await Amplify.DataStore.query(Customer.classType,
          where: Customer.USER.eq(_user!.id));
      _customer = list[0];
    } catch (e) {
      print(e);
    }
    //This call is what triggers the Views to update whenever this ViewModel change
    notifyListeners();
  }

  // called with alphanumeric code to link to restaurant, and associated servers
  Future<void> linkRestaurant(String code) async {
    try {
      var list = await Amplify.DataStore.query(Restaurant.classType,
          where: Restaurant.RESTAURANTCODE.eq(code));
      _restaurant = list[0];
      _servers = _restaurant!.servers;
    } catch (e) {
      print(e);
    }
    //This call is what triggers the Views to update whenever this ViewModel change
    notifyListeners();
  }
}
