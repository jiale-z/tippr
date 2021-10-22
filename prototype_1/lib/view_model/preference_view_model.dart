import 'package:flutter/cupertino.dart';
import 'package:prototype_1/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:prototype_1/models/DiningPreference.dart';
import 'package:provider/provider.dart';
import 'package:prototype_1/view_model/session.dart';

class PreferenceViewModel with ChangeNotifier {
  //These are the data fields you will directly access from the Views through Provider.of<PreferenceViewModel>(context).field
  //We use the Session singletone to access the User we already retrieved before
  User? _user = Session().user;
  List<DiningPreference>? _preferences;

  //Get methods for necessary fields
  User? get user {
    return _user;
  }

  List<DiningPreference>? get preferences {
    return _preferences;
  }

  //This function should be called on the initialization of the dining preferences page of the app.
  //It will retrieve the current User's dining preferences and update the field
  Future<void> fetchDiningPreferences() async {
    try {
      var list = await Amplify.DataStore.query(DiningPreference.classType,
          where: DiningPreference.USERID.eq(_user!.id));
      _preferences = list;
    } catch (e) {
      print(e);
    }

    //This call is what triggers the Views to update whenever this ViewModel change
    notifyListeners();
  }

  //This function will be called whenever the User creates a new Dining Preference
  Future<void> addDiningPreference(String val) async {
    DiningPreference newPref = DiningPreference(userID: _user!.id, value: val);
    try {
      await Amplify.DataStore.save(newPref);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  //This function will be called whenever the User deletes one of their Dining Preferences
  Future<void> deleteDiningPreference(String id) async {
    (await Amplify.DataStore.query(DiningPreference.classType,
            where: DiningPreference.ID.eq(id)))
        .forEach((element) async {
      try {
        await Amplify.DataStore.delete(element);
      } catch (e) {
        print('Delete failed: $e');
      }
    });
  }
}
