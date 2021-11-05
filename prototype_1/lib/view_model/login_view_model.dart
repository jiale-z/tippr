import 'package:flutter/cupertino.dart';
import 'package:prototype_1/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:prototype_1/models/DiningPreference.dart';
import 'package:provider/provider.dart';
import 'package:prototype_1/view_model/session.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class LoginViewModel with ChangeNotifier {
  //These are the data fields you will directly access from the Views through Provider.of<PreferenceViewModel>(context).field
  //We use the Session singleton to access the User we already retrieved before
  User? _user = Session().user;
  // If registered user has signed in successfully
  // successful login, go to home screen
  bool _isSignedIn = false;
  // If new user does first stage of registration, CONFIRMATION MISSING
  // prompt user to input confirmation code from email
  bool _isSignUpComplete = false;
  // If new user does second stage of registration, CONFIRMATION DONE
  // successful confirmation, go to home screen
  bool _isConfirmComplete = false;
  User? userTemp;

  //Get methods for necessary fields
  User? get user {
    return _user;
  }

  //Get methods for necessary fields
  bool get isSignedIn {
    return _isSignedIn;
  }
  //Get methods for necessary fields
  bool get isSignUpComplete {
    return _isSignUpComplete;
  }
  //Get methods for necessary fields
  bool get isConfirmComplete {
    return _isConfirmComplete;
  }

  Future<void> login(String email, String password) async {
    var list = [];
    try {
      SignInResult res = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
      _isSignedIn = res.isSignedIn;
    } on AuthException catch (e) {
      print(e.message);
    }

    try {
      list = await Amplify.DataStore.query(User.classType,
          where: User.EMAIL.eq(email));
    } catch (e) {
      print(e.toString());
    }

    _user = list[0];
    Session().setUser(_user!);

    notifyListeners();
  }

  Future<void> register(String email, String password, String name) async {
    userTemp = User(email: email, name: name);

    try {
      Map<String, String> userAttributes = {
        'email': email,
        // additional attributes as needed
      };
      SignUpResult res = await Amplify.Auth.signUp(
          username: email,
          password: password,
          options: CognitoSignUpOptions(
              userAttributes: userAttributes
          )
      );
      _isSignUpComplete = res.isSignUpComplete;
    } on AuthException catch (e) {
      print(e.message);
    }
    notifyListeners();
  }

  Future<void> confirmRegistration(String confirmationCode) async {
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
          username: userTemp!.email,
          confirmationCode: confirmationCode,
      );
      _isConfirmComplete = res.isSignUpComplete;
      if (isConfirmComplete) {
        try {
          await Amplify.DataStore.save(userTemp!);
        } catch (e) {
          print(e.toString());
        }
      }
    } on AuthException catch (e) {
      print(e.message);
    }

    Session().setUser(userTemp!);

    notifyListeners();
  }
}
