import 'package:flutter/cupertino.dart';
import 'package:prototype_1/models/ModelProvider.dart';
import 'package:prototype_1/models/User.dart';
import 'package:prototype_1/models/Link.dart';
import 'package:prototype_1/models/ServerBio.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:prototype_1/view_model/session.dart';

class HomeViewModel with ChangeNotifier {
  User? _user;
  User? _server;
  ServerBio? _server_bio;

  Future<void> fetchUserData() async {
    try {
      var list = await Amplify.DataStore.query(User.classType,
          where: User.ID.eq('b8134243-ecf9-4cdb-a1d9-c649ca9d24ec'));
      _user = list[0];
    } catch (e) {
      print(e);
    }
    print(_user!.toString());
    Session().setUser(_user!);
    notifyListeners();
  }

  Future<void> createServerLink(String serverCode) async {
    var list;
    try {
      list = await Amplify.DataStore.query(User.classType,
          where: User.SERVERCODE.eq(serverCode));
    } catch (e) {
      print("Could not find that server");
    }

    _server = list[0];
    Link link = Link(Customer: _user!, serverID: _server!.id);
    try {
      await Amplify.DataStore.save(link);
    } catch (e) {
      print(e);
    }

    var bioList;
    try {
      bioList = await Amplify.DataStore.query(ServerBio.classType,
          where: ServerBio.SERVER.eq(_server!.id));
      print('biolist' + bioList);
    } catch (e) {
      print(e);
    }
    _server_bio = bioList[0];
    notifyListeners();
  }

  Future<void> deleteServerLink() async {
    (await Amplify.DataStore.query(Link.classType,
            where: Link.CUSTOMER.eq(_user)))
        .forEach((element) async {
      try {
        await Amplify.DataStore.delete(element);
      } catch (e) {
        print('Delete failed: $e');
      }
    });
    notifyListeners();
  }

  User? get user {
    return _user;
  }

  User? get server {
    return _server;
  }

  ServerBio? get serverBio {
    return _server_bio;
  }
}
