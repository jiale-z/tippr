import 'package:flutter/cupertino.dart';
import 'package:prototype_1/models/ModelProvider.dart';
import 'package:prototype_1/models/User.dart';
import 'package:prototype_1/models/Link.dart';
import 'package:prototype_1/models/ServerBio.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:prototype_1/view_model/session.dart';

class HomeViewModel with ChangeNotifier {
  //These are the data fields you will directly access from the Views through Provider.of<HomeViewModel>(context).field
  User? _user;
  User? _server;
  ServerBio? _server_bio;

  //Get methods for all neccessary fields
  User? get user {
    return _user;
  }

  User? get server {
    return _server;
  }

  ServerBio? get serverBio {
    return _server_bio;
  }

  //This function should be called on the initialization of the first page of the app. It will retrieve the current User's data and update the user field
  Future<void> fetchUserData() async {
    try {
      var list = await Amplify.DataStore.query(User.classType,
          where: User.ID.eq('b8134243-ecf9-4cdb-a1d9-c649ca9d24ec'));
      _user = list[0];
    } catch (e) {
      print(e);
    }

    //This Session() singleton class is what allows us to store the User data and access between any ViewModels
    Session().setUser(_user!);

    //This call is what triggers the Views to update whenever this ViewModel changes
    notifyListeners();
  }

  //This function will be called whenever a Customer inputs a Server code to be connected to a server.
  //It creates the relationship on the backend as well as updating the relevant fields.
  Future<void> createServerLink(String serverCode) async {
    //Get the Server User from the Server Code
    var list;
    try {
      list = await Amplify.DataStore.query(User.classType,
          where: User.SERVERCODE.eq(serverCode));
    } catch (e) {
      print("Could not find that server");
    }
    _server = list[0];

    //Create and Store the Link object representing the relationship
    Link link = Link(Customer: _user!, serverID: _server!.id);
    try {
      await Amplify.DataStore.save(link);
    } catch (e) {
      print(e);
    }

    //Retrieve and store the Server Bio for the Server User
    var bioList;
    try {
      bioList = await Amplify.DataStore.query(ServerBio.classType,
          where: ServerBio.SERVER.eq(_server!.id));
    } catch (e) {
      print(e);
    }
    _server_bio = bioList[0];

    notifyListeners();
  }

  //This function should be called whenever the service has been completed.
  //It will delete the relationship from the backend
  Future<void> deleteServerLink() async {
    //Find the link to delete
    (await Amplify.DataStore.query(Link.classType,
            where: Link.CUSTOMER.eq(_user!.id)))
        .forEach((element) async {
      //Delete it
      try {
        await Amplify.DataStore.delete(element);
      } catch (e) {
        print('Delete failed: $e');
      }
    });

    notifyListeners();
  }
}
