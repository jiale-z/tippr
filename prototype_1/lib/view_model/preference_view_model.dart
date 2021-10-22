import 'package:flutter/cupertino.dart';
import 'package:prototype_1/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:prototype_1/models/DiningPreference.dart';
import 'package:provider/provider.dart';
import 'package:prototype_1/view_model/session.dart';

class PreferenceViewModel with ChangeNotifier {
  User? _user = Session().user;
  List<DiningPreference>? _preferences;

  User? get user {
    return _user;
  }

  List<DiningPreference>? get preferences {
    return _preferences;
  }

  Future<void> fetchDiningPreferences() async {
    try {
      var list = await Amplify.DataStore.query(DiningPreference.classType,
          where: DiningPreference.USERID.eq(_user!.id));
      _preferences = list;
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<void> addDiningPreference(String val) async {
    DiningPreference newPref = DiningPreference(userID: _user!.id, value: val);
    try {
      await Amplify.DataStore.save(newPref);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

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
