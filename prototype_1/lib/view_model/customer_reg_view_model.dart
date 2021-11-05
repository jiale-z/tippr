import 'package:flutter/cupertino.dart';
import 'package:prototype_1/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:prototype_1/models/Allergens.dart';
import 'package:prototype_1/models/ModelProvider.dart';
import 'package:provider/provider.dart';
import 'package:prototype_1/view_model/session.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class CustomerRegViewModel with ChangeNotifier {
  //These are the data fields you will directly access from the Views through Provider.of<PreferenceViewModel>(context).field
  //We use the Session singleton to access the User we already retrieved before
  User? _user = Session().user;

  bool _isCustomerRegComplete = false;

  //Get methods for necessary fields
  bool get isCustomerRegComplete {
    return _isCustomerRegComplete;
  }

  //Get methods for necessary fields
  User? get user {
    return _user;
  }

  // called once customer survey is complete, with comm level and allergens list
  // Allergens list is an array (size 9) of booleans with EXACT order as follows
  // [milk, eggs, fish, shellfish, treeNuts, peanuts, wheat, soy, sesame]
  Future<void> registerCustomer(int comLevel, List<bool> allergens) async {

    Customer cust = Customer(communicationPreference: comLevel, allergens: Allergens(allergens), user: _user!);

    try {
      await Amplify.DataStore.save(cust);
      _isCustomerRegComplete = true;
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

}
