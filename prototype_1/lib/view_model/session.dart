import 'package:prototype_1/models/User.dart';

class Session {
  late User _user;

  static final Session _instance = Session._internal();

  factory Session() {
    return _instance;
  }

  Session._internal() {
    _user = User(id: '', name: '', email: '');
  }

  setUser(User newUser) {
    _user = newUser;
  }

  User get user {
    return _user;
  }
}
